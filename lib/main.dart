import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_localizations/flutter_localizations.dart';

// Import correctly from the local directory
import 'l10n/app_localizations.dart';

void main() {
  runApp(const ExodusApp());
}

class ExodusApp extends StatefulWidget {
  const ExodusApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _ExodusAppState? state = context.findAncestorStateOfType<_ExodusAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<ExodusApp> createState() => _ExodusAppState();
}

class _ExodusAppState extends State<ExodusApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    if (languageCode != null) {
      setState(() {
        _locale = Locale(languageCode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exodus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1976D2)),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _entered = 0;
  int _inside = 0;
  int _capacity = 250;
  String _locationName = "Main Entrance";
  final List<Map<String, int>> _history = [];
  String _countingMode = 'button';
  late SharedPreferences _prefs;
  bool _isInitialized = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isAlarmLooping = false;
  bool _alarmSilenced = false;
  bool _audioUnlocked = false;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _initApp() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _entered = _prefs.getInt('last_entered') ?? 0;
      _inside = _prefs.getInt('last_inside') ?? 0;
      _capacity = _prefs.getInt('capacity') ?? 250;
      _locationName = _prefs.getString('location_name') ?? "Main Entrance";
      _countingMode = _prefs.getString('counting_mode') ?? 'button';
      _isInitialized = true;
    });
    _logEntry("START");
  }

  Future<void> _saveState() async {
    await _prefs.setInt('last_entered', _entered);
    await _prefs.setInt('last_inside', _inside);
    await _prefs.setInt('capacity', _capacity);
    await _prefs.setString('location_name', _locationName);
  }

  void _showError(dynamic e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Audio Error: $e"), backgroundColor: Colors.red),
    );
  }

  Future<void> _unlockAudio() async {
    if (_audioUnlocked || !kIsWeb) return;
    try {
      await _audioPlayer.setVolume(0.0);
      await _audioPlayer.play(AssetSource('images/beep.mp3'));
      await _audioPlayer.stop();
      _audioUnlocked = true;
    } catch (e) {
      _showError(e);
    }
  }

  void _playAlarm() async {
    int threshold = (_capacity * 0.02).round();
    if (threshold < 10) threshold = 10;
    int startAt = _capacity - threshold;

    if (_inside >= _capacity) {
      if (!_isAlarmLooping && !_alarmSilenced) {
        setState(() => _isAlarmLooping = true);
        try {
          await _audioPlayer.setReleaseMode(ReleaseMode.loop);
          await _audioPlayer.setVolume(1.0);
          await _audioPlayer.play(AssetSource('images/beep.mp3'));
        } catch (e) {
          _showError(e);
        }
      }
    } else if (_inside > startAt) {
      _alarmSilenced = false; 
      if (_isAlarmLooping) {
        _stopAlarm(resetSilence: false);
      }
      double volume = (_inside - startAt) / threshold;
      if (volume > 1.0) volume = 1.0;
      try {
        await _audioPlayer.setReleaseMode(ReleaseMode.release);
        await _audioPlayer.setVolume(volume);
        await _audioPlayer.play(AssetSource('images/beep.mp3'));
      } catch (e) {
        _showError(e);
      }
    } else {
      _alarmSilenced = false;
      if (_isAlarmLooping) {
        _stopAlarm(resetSilence: false);
      }
    }
  }

  void _stopAlarm({bool resetSilence = true}) {
    _audioPlayer.stop();
    setState(() {
      _isAlarmLooping = false;
      if (resetSilence) _alarmSilenced = true;
    });
  }

  void _setCountingMode(String mode) {
    HapticFeedback.selectionClick();
    _unlockAudio();
    setState(() {
      _countingMode = mode;
    });
    _prefs.setString('counting_mode', _countingMode);
  }

  void _changeCount(int entDelta, int insDelta) {
    if (insDelta < 0 && _inside <= 0) return;

    HapticFeedback.lightImpact();
    _unlockAudio();
    setState(() {
      _history.add({'entered': _entered, 'inside': _inside});
      if (_history.length > 50) _history.removeAt(0);

      _entered += entDelta;
      _inside += insDelta;
    });
    _playAlarm();
    _saveState();
  }

  void _undo() {
    final l10n = AppLocalizations.of(context)!;
    if (_history.isNotEmpty) {
      HapticFeedback.mediumImpact();
      final lastState = _history.removeLast();
      setState(() {
        _entered = lastState['entered']!;
        _inside = lastState['inside']!;
      });
      _saveState();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.nothingToUndo)),
      );
    }
  }

  Future<void> _logEntry(String tag) async {
    if (!_isInitialized) return;
    final now = DateTime.now();
    final displayTimestamp = DateFormat('dd.MM.yyyy HH:mm:ss').format(now);
    final entry = "${now.millisecondsSinceEpoch} | $displayTimestamp | $tag ($_locationName) | $_entered | $_inside";

    final existing = _prefs.getStringList('entries') ?? [];
    existing.add(entry);
    await _prefs.setStringList('entries', existing);
  }

  Future<void> _exportCSV() async {
    final existing = _prefs.getStringList('entries') ?? [];
    final l10n = AppLocalizations.of(context)!;
    if (existing.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.noMatches)));
      return;
    }
    try {
      final csvContent = StringBuffer();
      csvContent.writeln("Timestamp,Date_Time,Tag,Entered,Inside");
      for (var entry in existing) {
        csvContent.writeln(entry.replaceAll(" | ", ","));
      }

      if (kIsWeb) {
        final bytes = Uint8List.fromList(csvContent.toString().codeUnits);
        await Share.shareXFiles([XFile.fromData(bytes, name: 'exodus_logs_${DateTime.now().millisecondsSinceEpoch}.csv', mimeType: 'text/csv')], text: 'Exodus Logs - $_locationName');
      } else {
        final directory = await getTemporaryDirectory();
        final file = io.File('${directory.path}/exodus_logs_${DateTime.now().millisecondsSinceEpoch}.csv');
        await file.writeAsString(csvContent.toString());
        await Share.shareXFiles([XFile(file.path)], text: 'Exodus Logs - $_locationName');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("CSV Export failed: $e")));
    }
  }

  Future<pw.Document> _generateDocument() async {
    final existing = _prefs.getStringList('entries') ?? [];
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(level: 0, child: pw.Text("EXODUS: VENUE REPORT")),
          pw.Container(
            padding: const pw.EdgeInsets.all(10),
            decoration: const pw.BoxDecoration(color: PdfColors.grey100),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text("SUMMARY", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                pw.SizedBox(height: 5),
                pw.Text("Location: $_locationName"),
                pw.Text("Report Date: ${DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now())}"),
              ],
            ),
          ),
          pw.SizedBox(height: 20),
          pw.TableHelper.fromTextArray(
            headers: ["Date/Time", "Event", "Entered", "Inside"],
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            data: existing.map((e) {
              final p = e.split(" | ");
              if (p.length < 5) return ["", "", "", ""];
              return [p[1], p[2], p[3], p[4]];
            }).toList(),
          ),
        ],
      ),
    );
    return pdf;
  }

  Future<void> _exportPDF() async {
    final existing = _prefs.getStringList('entries') ?? [];
    if (existing.isEmpty) return;
    try {
      final pdf = await _generateDocument();
      final pdfBytes = await pdf.save();

      if (kIsWeb) {
        await Share.shareXFiles([XFile.fromData(pdfBytes, name: 'Exodus_Report_${DateTime.now().millisecondsSinceEpoch}.pdf', mimeType: 'application/pdf')], text: 'Exodus Venue Report');
      } else {
        final directory = await getTemporaryDirectory();
        final file = io.File('${directory.path}/exodus_report_${DateTime.now().millisecondsSinceEpoch}.pdf');
        await file.writeAsBytes(pdfBytes);
        await Share.shareXFiles([XFile(file.path)], text: 'Exodus Venue Report');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("PDF Export failed: $e")));
    }
  }

  void _showMenu() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.save),
            title: Text(l10n.logNow),
            onTap: () {
              _logEntry("LOG NOW");
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.loggedCurrentTotals)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: Text(l10n.viewLog),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LogScreen(locationName: _locationName)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.share, color: Color(0xFF1976D2)),
            title: Text(l10n.exportLogs),
            onTap: () {
              Navigator.pop(context);
              _showExportMenu();
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(l10n.helpAndInfo),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: Text(l10n.resetSession),
            onTap: () {
              Navigator.pop(context);
              _handleResetFlow();
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: Text(l10n.setLocation),
            onTap: () {
              Navigator.pop(context);
              _showNameDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showExportMenu() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.grid_on),
            title: Text(l10n.exportAsCSV),
            onTap: () {
              Navigator.pop(context);
              _exportCSV();
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: Text(l10n.exportAsPDF),
            onTap: () {
              Navigator.pop(context);
              _exportPDF();
            },
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: Text(l10n.previewReport),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(locationName: _locationName, docBuilder: _generateDocument)));
              if (mounted) _showExportMenu();
            },
          ),
        ],
      ),
    );
  }

  void _handleResetFlow() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.resetSessionQuestion),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _confirmReset();
            },
            child: Text(l10n.justReset),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showExportMenu();
            },
            child: Text(l10n.exportFirst),
          ),
        ],
      ),
    );
  }

  void _confirmReset() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmFullReset),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () {
              HapticFeedback.vibrate();
              setState(() {
                _entered = 0;
                _inside = 0;
                _history.clear();
              });
              _prefs.setStringList('entries', []); // Empty the log
              _saveState();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.sessionResetSuccess)));
            },
            child: Text(l10n.resetEverything, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showNameDialog() {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: _locationName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.setLocationName),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: l10n.locationNameHint),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() => _locationName = controller.text);
                _saveState();
                _logEntry("LOCATION CHANGE");
                Navigator.pop(context);
              }
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(String label, int currentValue, Function(int) onSave) {
    final l10n = AppLocalizations.of(context)!;
    String localValue = '$currentValue';
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text('${l10n.save} $label'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(localValue, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue)),
                const Divider(),
                SizedBox(
                  width: 240,
                  height: 300,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      String key = "";
                      if (index < 9) key = "${index + 1}";
                      if (index == 9) key = l10n.clear;
                      if (index == 10) key = "0";
                      if (index == 11) key = l10n.ok;

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: key == l10n.ok ? Colors.green : (key == l10n.clear ? Colors.red : Colors.blue.shade50),
                          foregroundColor: (key == l10n.ok || key == l10n.clear) ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          HapticFeedback.selectionClick();
                          setDialogState(() {
                            if (key == l10n.clear) {
                              localValue = "0";
                            } else if (key == l10n.ok) {
                              int? finalVal = int.tryParse(localValue);
                              if (finalVal != null) {
                                if (label == l10n.stillInside && finalVal > _entered) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationExceedEntered)));
                                } else if (label == l10n.entered && finalVal < _inside) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationLessInside)));
                                } else {
                                  onSave(finalVal);
                                  Navigator.pop(context);
                                }
                              }
                            } else {
                              if (localValue == "0") {
                                localValue = key;
                              } else {
                                if (localValue.length < 6) localValue += key;
                              }
                            }
                          });
                        },
                        child: Text(key, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      );
                    },
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final l10n = AppLocalizations.of(context)!;
    int threshold = (_capacity * 0.02).round();
    if (threshold < 10) threshold = 10;
    int startAt = _capacity - threshold;

    Color insideColor;
    if (_inside <= startAt) {
      insideColor = Colors.white.withValues(alpha: 0.9);
    } else {
      double weight = (_inside - startAt) / threshold;
      if (weight > 1.0) weight = 1.0;
      insideColor = Color.lerp(Colors.white, Colors.red, weight)!.withValues(alpha: 0.9);
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(icon: const Icon(Icons.undo, color: Colors.black, size: 28), onPressed: _undo),
            centerTitle: true,
            flexibleSpace: GestureDetector(
              onLongPress: () {
                HapticFeedback.mediumImpact();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen()));
              },
              child: Center(
                child: SafeArea(
                  child: Image.asset(
                    "images/exodus_logo_header.png",
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onLongPress: () {
                  HapticFeedback.mediumImpact();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogScreen(locationName: _locationName)));
                },
                child: IconButton(
                  icon: const Icon(Icons.settings, color: Colors.black, size: 28),
                  onPressed: _showMenu,
                ),
              ),
            ],
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _unlockAudio,
          onVerticalDragEnd: _countingMode == 'gestures' ? (details) {
            _unlockAudio();
            if (details.primaryVelocity! < 0) _changeCount(1, 1);
            if (details.primaryVelocity! > 0) _changeCount(0, -1);
          } : null,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.touch_app, color: _countingMode == 'button' ? Colors.blue : Colors.black, size: 32),
                            onPressed: () => _setCountingMode('button'),
                          ),
                          const SizedBox(width: 40),
                          IconButton(
                            icon: Icon(Icons.swipe, color: _countingMode == 'gestures' ? Colors.blue : Colors.black, size: 32),
                            onPressed: () => _setCountingMode('gestures'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              HapticFeedback.mediumImpact();
                              _showNameDialog();
                            },
                            child: Text(
                              _locationName,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1976D2)),
                            ),
                          ),
                          GestureDetector(
                            onTap: _isAlarmLooping ? _stopAlarm : null,
                            onLongPress: () {
                              HapticFeedback.mediumImpact();
                              _showEditDialog(l10n.capacity, _capacity, (val) {
                                setState(() => _capacity = val);
                                _saveState();
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_isAlarmLooping)
                                  const Icon(Icons.notifications_active, color: Colors.red, size: 20),
                                Text(
                                  "${l10n.capacity}: $_capacity",
                                  style: TextStyle(
                                    fontSize: 16, 
                                    fontWeight: FontWeight.bold, 
                                    color: _isAlarmLooping ? Colors.red : Colors.black87
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 1),
                      Expanded(flex: 6, child: _buildCounterCard(l10n.entered, _entered, const Color(0xFF2196F3), 1, 1, Colors.white.withValues(alpha: 0.9))),
                      const SizedBox(height: 8),
                      Expanded(flex: 6, child: _buildCounterCard(l10n.stillInside, _inside, const Color(0xFF4CAF50), 0, -1, insideColor)),
                      if (_countingMode == 'gestures')
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(l10n.swipeToCount, style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black54)),
                        ),
                      const Spacer(flex: 1),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildLanguageFlag('🇬🇧', 'en'),
                            const SizedBox(width: 20),
                            _buildLanguageFlag('🇩🇪', 'de'),
                            const SizedBox(width: 20),
                            _buildLanguageFlag('🇫🇷', 'fr'),
                            const SizedBox(width: 20),
                            _buildLanguageFlag('🇮🇹', 'it'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(
                      "v1.0.15+16",
                      style: const TextStyle(fontSize: 10, color: Colors.black38),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageFlag(String flag, String code) {
    return GestureDetector(
      onLongPress: () async {
        HapticFeedback.mediumImpact();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('language_code', code);
        if (mounted) {
          ExodusApp.setLocale(context, Locale(code));
        }
      },
      child: Text(
        flag,
        style: const TextStyle(fontSize: 32),
      ),
    );
  }

  Widget _buildCounterCard(String label, int value, Color btnColor, int entD, int insD, Color cardColor) {
    return GestureDetector(
      onLongPress: () {
        HapticFeedback.mediumImpact();
        _showEditDialog(label, value, (newValue) {
          final oldEnt = _entered;
          final oldIns = _inside;
          setState(() {
            final l10n = AppLocalizations.of(context)!;
            if (label == l10n.entered) {
              _entered = newValue;
            } else if (label == l10n.stillInside) {
              _inside = newValue;
            }
          });
          _saveState();
          _logEntry("MANUAL EDIT: $oldEnt->$_entered, $oldIns->$_inside");
        });
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 4,
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label.toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: FittedBox(
                        key: ValueKey<int>(value),
                        fit: BoxFit.contain,
                        child: Text('$value', style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                if (_countingMode == 'button') ...[
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: btnColor, foregroundColor: Colors.white, padding: EdgeInsets.zero),
                      onPressed: () => _changeCount(entD, insD),
                      child: Text(entD > 0 ? "+" : "-", style: const TextStyle(fontSize: 30)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogScreen extends StatefulWidget {
  final String locationName;
  const LogScreen({super.key, required this.locationName});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  List<String> _entries = [];
  List<String> _filteredEntries = [];
  bool _isDescending = true;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadLogs();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadLogs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _entries = prefs.getStringList('entries') ?? [];
      _sortLogs();
      _filteredEntries = List.from(_entries);
    });
  }

  void _sortLogs() {
    setState(() {
      if (_isDescending) {
        _entries.sort((a, b) => b.split(" | ").first.compareTo(a.split(" | ").first));
      } else {
        _entries.sort((a, b) => a.split(" | ").first.compareTo(b.split(" | ").first));
      }
      _applyFilter(_searchController.text);
    });
  }

  void _applyFilter(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredEntries = List.from(_entries);
      } else {
        _filteredEntries = _entries.where((e) => e.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  Future<void> _deleteEntry(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final actualEntry = _filteredEntries[index];
    _searchFocusNode.unfocus();
    setState(() {
      _entries.remove(actualEntry);
      _filteredEntries.removeAt(index);
    });
    await prefs.setStringList('entries', _entries);
  }

  Future<void> _deleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _entries.clear();
      _filteredEntries.clear();
    });
    await prefs.setStringList('entries', []);
  }

  Future<void> _exportCSV() async {
    final l10n = AppLocalizations.of(context)!;
    if (_entries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.noMatches)));
      return;
    }
    try {
      final csvContent = StringBuffer();
      csvContent.writeln("Timestamp,Date_Time,Tag,Entered,Inside");
      for (var entry in _entries) {
        csvContent.writeln(entry.replaceAll(" | ", ","));
      }

      if (kIsWeb) {
        final bytes = Uint8List.fromList(csvContent.toString().codeUnits);
        await Share.shareXFiles([XFile.fromData(bytes, name: 'exodus_logs_${DateTime.now().millisecondsSinceEpoch}.csv', mimeType: 'text/csv')], text: 'Exodus Logs - ${widget.locationName}');
      } else {
        final directory = await getTemporaryDirectory();
        final file = io.File('${directory.path}/exodus_logs_${DateTime.now().millisecondsSinceEpoch}.csv');
        await file.writeAsString(csvContent.toString());
        await Share.shareXFiles([XFile(file.path)], text: 'Exodus Logs - ${widget.locationName}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("CSV Export failed: $e")));
    }
  }

  Future<pw.Document> _generateDocument() async {
    final prefs = await SharedPreferences.getInstance();
    final entries = prefs.getStringList('entries') ?? [];
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(level: 0, child: pw.Text("EXODUS: VENUE REPORT")),
          pw.Container(
            padding: const pw.EdgeInsets.all(10),
            decoration: const pw.BoxDecoration(color: PdfColors.grey100),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text("SUMMARY", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                pw.SizedBox(height: 5),
                pw.Text("Location: ${widget.locationName}"),
                pw.Text("Report Date: ${DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now())}"),
              ],
            ),
          ),
          pw.SizedBox(height: 20),
          pw.TableHelper.fromTextArray(
            headers: ["Date/Time", "Event", "Entered", "Inside"],
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            data: entries.map((e) {
              final p = e.split(" | ");
              if (p.length < 5) return ["", "", "", ""];
              return [p[1], p[2], p[3], p[4]];
            }).toList(),
          ),
        ],
      ),
    );
    return pdf;
  }

  Future<void> _exportPDF() async {
    if (_entries.isEmpty) return;
    try {
      final pdf = await _generateDocument();
      final pdfBytes = await pdf.save();

      if (kIsWeb) {
        await Share.shareXFiles([XFile.fromData(pdfBytes, name: 'Exodus_Report_${DateTime.now().millisecondsSinceEpoch}.pdf', mimeType: 'application/pdf')], text: 'Exodus Venue Report');
      } else {
        final directory = await getTemporaryDirectory();
        final file = io.File('${directory.path}/exodus_report_${DateTime.now().millisecondsSinceEpoch}.pdf');
        await file.writeAsBytes(pdfBytes);
        await Share.shareXFiles([XFile(file.path)], text: 'Exodus Venue Report');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("PDF Export failed: $e")));
    }
  }

  void _showExportMenu() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.grid_on),
            title: Text(l10n.exportAsCSV),
            onTap: () {
              Navigator.pop(context);
              _exportCSV();
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: Text(l10n.exportAsPDF),
            onTap: () {
              Navigator.pop(context);
              _exportPDF();
            },
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: Text(l10n.previewReport),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(locationName: widget.locationName, docBuilder: _generateDocument)));
              if (mounted) _showExportMenu();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(l10n.viewLog),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(_isDescending ? Icons.arrow_downward : Icons.arrow_upward),
              onPressed: () {
                setState(() => _isDescending = !_isDescending);
                _sortLogs();
              },
            ),
            IconButton(
              icon: const Icon(Icons.share, color: Color(0xFF1976D2)),
              onPressed: () => _showExportMenu(),
            ),
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.red),
              onPressed: () => _confirmDeleteAll(),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                onChanged: _applyFilter,
                decoration: InputDecoration(
                  hintText: '${l10n.search}...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ),
        body: _filteredEntries.isEmpty
            ? Center(child: Text(l10n.noMatches, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)))
            : ListView.builder(
          itemCount: _filteredEntries.length,
          itemBuilder: (context, index) {
            final parts = _filteredEntries[index].split(" | ");
            if (parts.length < 5) return const SizedBox.shrink();
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              color: Colors.white.withValues(alpha: 0.9),
              child: ListTile(
                title: Text(parts[2], style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1976D2))),
                subtitle: Text(parts[1], style: const TextStyle(fontSize: 12)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("E: ${parts[3]}", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    Text("I: ${parts[4]}", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  ],
                ),
                onLongPress: () => _confirmDelete(index),
              ),
            );
          },
        ),
      ),
    );
  }

  void _confirmDelete(int index) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteEntryQuestion),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
          TextButton(onPressed: () { _deleteEntry(index); Navigator.pop(context); }, child: Text(l10n.delete)),
        ],
      ),
    );
  }

  void _confirmDeleteAll() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteAllEntriesQuestion),
        content: Text(l10n.thisCannotBeUndone),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
          TextButton(onPressed: () { _deleteAll(); Navigator.pop(context); }, child: Text(l10n.deleteAll, style: const TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}

class PreviewScreen extends StatelessWidget {
  final String locationName;
  final Future<pw.Document> Function() docBuilder;
  const PreviewScreen({super.key, required this.locationName, required this.docBuilder});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text('${l10n.previewReport}: $locationName')),
      body: PdfPreview(
        build: (format) async {
          final doc = await docBuilder();
          return doc.save();
        },
        allowPrinting: true,
        allowSharing: true,
        canChangeOrientation: false,
        canChangePageFormat: false,
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  Future<pw.Document> _generateManualPDF(AppLocalizations l10n) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(level: 0, child: pw.Text(l10n.userGuideTitle)),
          pw.Header(level: 1, text: l10n.guideOverviewTitle),
          pw.Paragraph(text: l10n.guideOverviewContent),
          pw.Bullet(text: l10n.guideOverviewEntered),
          pw.Bullet(text: l10n.guideOverviewInside),
          pw.Header(level: 1, text: l10n.guideDashboardTitle),
          pw.Paragraph(text: l10n.guideDashboardContent),
          pw.Bullet(text: l10n.guideDashboardHeader),
          pw.Bullet(text: l10n.guideDashboardLocation),
          pw.Bullet(text: l10n.guideDashboardCapacity),
          pw.Bullet(text: l10n.guideDashboardEnteredCard),
          pw.Bullet(text: l10n.guideDashboardInsideCard),
          pw.Header(level: 1, text: l10n.guideSafetyTitle),
          pw.Paragraph(text: l10n.guideSafetyContent),
          pw.Bullet(text: l10n.guideSafetyTransition),
          pw.Bullet(text: l10n.guideSafetyThreshold),
          pw.Bullet(text: l10n.guideSafetySignal),
          pw.Header(level: 1, text: l10n.guideInputTitle),
          pw.Paragraph(text: l10n.guideInputContent),
          pw.Header(level: 2, text: l10n.guideInputButtonTitle),
          pw.Bullet(text: l10n.guideInputButtonTapEntered),
          pw.Bullet(text: l10n.guideInputButtonTapInside),
          pw.Bullet(text: l10n.guideInputButtonBestFor),
          pw.Header(level: 2, text: l10n.guideInputSwipeTitle),
          pw.Bullet(text: l10n.guideInputSwipeUp),
          pw.Bullet(text: l10n.guideInputSwipeDown),
          pw.Bullet(text: l10n.guideInputSwipeBestFor),
          pw.Header(level: 1, text: l10n.guideCorrectionTitle),
          pw.Paragraph(text: l10n.guideCorrectionContent),
          pw.Bullet(text: l10n.guideCorrectionUndo),
          pw.Bullet(text: l10n.guideCorrectionManual),
          pw.Header(level: 1, text: l10n.guideLogTitle),
          pw.Paragraph(text: l10n.guideLogContent),
          pw.Bullet(text: l10n.guideLogSearch),
          pw.Bullet(text: l10n.guideLogDelete),
          pw.Bullet(text: l10n.guideLogExport),
          pw.Bullet(text: l10n.guideLogPreview),
          pw.Header(level: 1, text: l10n.guideSessionTitle),
          pw.Header(level: 2, text: l10n.guideSessionResetTitle),
          pw.Bullet(text: l10n.guideSessionResetContent),
          pw.Bullet(text: l10n.guideSessionResetExport),
          pw.Bullet(text: l10n.guideSessionResetConfirm),
          pw.SizedBox(height: 20),
          pw.Footer(
            leading: pw.Text("© 2024 GoGetGo Exodus", style: const pw.TextStyle(fontSize: 10)),
          ),
        ],
      ),
    );
    return pdf;
  }

  Future<pw.Document> _generateInstallationGuidePDF(AppLocalizations l10n) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Header(level: 0, child: pw.Text(l10n.installGuideTitle)),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: l10n.installMobileTitle),
          pw.Header(level: 2, text: l10n.installEdgeTitle),
          pw.Bullet(text: l10n.installEdgeStep1),
          pw.Bullet(text: l10n.installEdgeStep2),
          pw.Bullet(text: l10n.installEdgeStep3),
          pw.Bullet(text: l10n.installEdgeStep4),
          pw.Bullet(text: l10n.installEdgeStep5),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: l10n.installFirefoxTitle),
          pw.Text(l10n.installAndroid, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: l10n.installFirefoxStep1),
          pw.Bullet(text: l10n.installFirefoxStep2),
          pw.Bullet(text: l10n.installFirefoxStep3),
          pw.Bullet(text: l10n.installFirefoxStep4),
          pw.SizedBox(height: 5),
          pw.Text(l10n.installIos, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Paragraph(text: l10n.installFirefoxIosContent),
          pw.Bullet(text: l10n.installFirefoxIosStep1),
          pw.Bullet(text: l10n.installFirefoxIosStep2),
          pw.Bullet(text: l10n.installFirefoxIosStep3),
          pw.Bullet(text: l10n.installFirefoxIosStep4),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: l10n.installChromeTitle),
          pw.Text(l10n.installAndroid, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: l10n.installChromeAndroidStep1),
          pw.Bullet(text: l10n.installChromeAndroidStep2),
          pw.Bullet(text: l10n.installChromeAndroidStep3),
          pw.Bullet(text: l10n.installChromeAndroidStep4),
          pw.SizedBox(height: 5),
          pw.Text(l10n.installIos, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: l10n.installChromeIosStep1),
          pw.Bullet(text: l10n.installChromeIosStep2),
          pw.Bullet(text: l10n.installChromeIosStep3),
          pw.Bullet(text: l10n.installChromeIosStep4),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: l10n.installDesktopTitle),
          pw.Bullet(text: l10n.installDesktopStep1),
          pw.Bullet(text: l10n.installDesktopStep2),
          pw.Bullet(text: l10n.installDesktopStep3),
          pw.Bullet(text: l10n.installDesktopStep4),
          pw.Bullet(text: l10n.installDesktopStep5),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: l10n.installSafariIosTitle),
          pw.Bullet(text: l10n.installSafariIosStep1),
          pw.Bullet(text: l10n.installSafariIosStep2),
          pw.Bullet(text: l10n.installSafariIosStep3),
          pw.Bullet(text: l10n.installSafariIosStep4),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: l10n.installSafariMacTitle),
          pw.Text(l10n.installSafariMacNote, style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
          pw.Bullet(text: l10n.installSafariMacStep1),
          pw.Bullet(text: l10n.installSafariMacStep2),
          pw.Bullet(text: l10n.installSafariMacStep3),
          pw.Bullet(text: l10n.installSafariMacStep4),
        ],
      ),
    );
    return pdf;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(l10n.helpAndInfo),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.picture_as_pdf, color: Colors.blue),
              tooltip: 'Export Manual as PDF',
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(
                  locationName: l10n.userGuideTitle,
                  docBuilder: () => _generateManualPDF(l10n),
                )));
              },
            ),
            IconButton(
              icon: const Icon(Icons.install_mobile, color: Colors.green),
              tooltip: 'Export Installation Guide',
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(
                  locationName: l10n.installGuideTitle,
                  docBuilder: () => _generateInstallationGuidePDF(l10n),
                )));
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white.withValues(alpha: 0.9),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.userGuideTitle,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1976D2)),
                  ),
                  const Text(
                    "Version 1.0.15+16",
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  _buildHelpSection(l10n.guideOverviewTitle, "${l10n.guideOverviewContent}\n\n- ${l10n.guideOverviewEntered}\n- ${l10n.guideOverviewInside}"),
                  _buildHelpSection(l10n.guideDashboardTitle, "${l10n.guideDashboardContent}\n\n- ${l10n.guideDashboardHeader}\n- ${l10n.guideDashboardLocation}\n- ${l10n.guideDashboardCapacity}\n- ${l10n.guideDashboardEnteredCard}\n- ${l10n.guideDashboardInsideCard}\n\n${l10n.guideSafetyTitle}:\n${l10n.guideSafetyContent}\n- ${l10n.guideSafetyTransition}\n- ${l10n.guideSafetyThreshold}\n- ${l10n.guideSafetySignal}"),
                  _buildHelpSection(l10n.guideInputTitle, "${l10n.guideInputContent}\n\nA. ${l10n.guideInputButtonTitle}\n- ${l10n.guideInputButtonTapEntered}\n- ${l10n.guideInputButtonTapInside}\n- ${l10n.guideInputButtonBestFor}\n\nB. ${l10n.guideInputSwipeTitle}\n- ${l10n.guideInputSwipeUp}\n- ${l10n.guideInputSwipeDown}\n- ${l10n.guideInputSwipeBestFor}"),
                  _buildHelpSection(l10n.guideCorrectionTitle, "${l10n.guideCorrectionContent}\n\n- ${l10n.guideCorrectionUndo}\n- ${l10n.guideCorrectionManual}"),
                  _buildHelpSection(l10n.guideLogTitle, "${l10n.guideLogContent}\n\n- ${l10n.guideLogSearch}\n- ${l10n.guideLogDelete}\n- ${l10n.guideLogExport}\n- ${l10n.guideLogPreview}"),
                  _buildHelpSection(l10n.guideSessionTitle, "${l10n.guideSessionResetTitle}:\n- ${l10n.guideSessionResetContent} ${l10n.guideSessionResetExport}\n- ${l10n.guideSessionResetConfirm}"),
                  const SizedBox(height: 30),
                  const Center(child: Text("© 2024 GoGetGo Exodus", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHelpSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Divider(),
          Text(content, style: const TextStyle(fontSize: 15, height: 1.5)),
        ],
      ),
    );
  }
}
