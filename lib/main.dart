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

void main() {
  runApp(const ExodusApp());
}

class ExodusApp extends StatelessWidget {
  const ExodusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exodus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1976D2)),
        useMaterial3: true,
      ),
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
  int _capacity = 100;
  String _locationName = "Main Entrance";
  final List<Map<String, int>> _history = [];
  String _countingMode = 'button';
  late SharedPreferences _prefs;
  bool _isInitialized = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

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
      _capacity = _prefs.getInt('capacity') ?? 100;
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

  void _playSound() async {
    // try {
    //   await _audioPlayer.play(AssetSource('click.mp3'), mode: PlayerMode.lowLatency);
    // } catch (_) {}
  }

  void _setCountingMode(String mode) {
    HapticFeedback.selectionClick();
    setState(() {
      _countingMode = mode;
    });
    _prefs.setString('counting_mode', _countingMode);
  }

  void _changeCount(int entDelta, int insDelta) {
    if (insDelta < 0 && _inside <= 0) return;

    HapticFeedback.lightImpact();
    _playSound();
    setState(() {
      _history.add({'entered': _entered, 'inside': _inside});
      if (_history.length > 50) _history.removeAt(0);

      _entered += entDelta;
      _inside += insDelta;
    });
    _saveState();
  }

  void _undo() {
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
        const SnackBar(content: Text('Nothing to undo')),
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
    if (existing.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No logs to export")));
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
        final file = io.File('${directory.path}/Exodus_Report_${DateTime.now().millisecondsSinceEpoch}.pdf');
        await file.writeAsBytes(pdfBytes);
        await Share.shareXFiles([XFile(file.path)], text: 'Exodus Venue Report');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("PDF Export failed: $e")));
    }
  }

  void _showMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text('Log NOW'),
            onTap: () {
              _logEntry("LOG NOW");
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged current totals')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('View Log'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LogScreen(locationName: _locationName)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.share, color: Color(0xFF1976D2)),
            title: const Text('Export Logs'),
            onTap: () {
              Navigator.pop(context);
              _showExportMenu();
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Info'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: const Text('Reset Session'),
            onTap: () {
              Navigator.pop(context);
              _handleResetFlow();
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Set Location'),
            onTap: () {
              Navigator.pop(context);
              _showNameDialog();
            },
          ),
          ListTile(
            leading: const Icon(Icons.power_settings_new, color: Colors.red),
            title: Text(!kIsWeb && io.Platform.isAndroid ? 'Shutdown' : 'Close Session'),
            onTap: () async {
              if (!kIsWeb && io.Platform.isAndroid) {
                _shutdown();
              } else {
                await _logEntry("CLOSE SESSION");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Session closed')));
              }
            },
          ),
        ],
      ),
    );
  }

  void _showExportMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.grid_on),
            title: const Text("Export as CSV"),
            onTap: () {
              Navigator.pop(context);
              _exportCSV();
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text("Export as PDF"),
            onTap: () {
              Navigator.pop(context);
              _exportPDF();
            },
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text("Preview Report"),
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Session?'),
        content: const Text('Would you like to export the current log before resetting?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _confirmReset();
            },
            child: const Text('Just Reset'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showExportMenu();
            },
            child: const Text('Export First'),
          ),
        ],
      ),
    );
  }

  void _confirmReset() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Full Reset'),
        content: const Text('This will delete ALL logs and reset counters to zero. This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
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
              _logEntry("RESET"); // New log entry for the new session
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Session reset successfully')));
            },
            child: const Text('Reset Everything', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showNameDialog() {
    final controller = TextEditingController(text: _locationName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Location Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "e.g. Main Entrance"),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() => _locationName = controller.text);
                _saveState();
                _logEntry("LOCATION CHANGE");
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(String label, int currentValue, Function(int) onSave) {
    String localValue = '$currentValue';
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text('Set $label'),
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
                      if (index == 9) key = "CLR";
                      if (index == 10) key = "0";
                      if (index == 11) key = "OK";

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: key == "OK" ? Colors.green : (key == "CLR" ? Colors.red : Colors.blue.shade50),
                          foregroundColor: (key == "OK" || key == "CLR") ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          HapticFeedback.selectionClick();
                          setDialogState(() {
                            if (key == "CLR") {
                              localValue = "0";
                            } else if (key == "OK") {
                              int? finalVal = int.tryParse(localValue);
                              if (finalVal != null) {
                                if (label == 'Still Inside' && finalVal > _entered) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cannot exceed 'Entered'")));
                                } else if (label == 'Entered' && finalVal < _inside) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cannot be less than 'Still Inside'")));
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
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ],
          );
        },
      ),
    );
  }

  void _shutdown() async {
    HapticFeedback.vibrate();
    await _logEntry("SHUTDOWN");
    SystemNavigator.pop();
    if (!kIsWeb) {
      io.exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    int threshold = (_capacity * 0.02).round();
    if (threshold < 10) threshold = 10;
    int startAt = _capacity - threshold;

    Color insideColor;
    if (_inside <= startAt) {
      insideColor = Colors.white.withValues(alpha: 0.9);
    } else {
      double weight = (_inside - startAt) / threshold;
      if (weight > 1.0) weight = 1.0;
      insideColor = Color.lerp(Colors.white, Colors.red.shade300, weight)!.withValues(alpha: 0.9);
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/assets/background.png"),
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
                    "assets/assets/exodus_logo_header.png",
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
          onVerticalDragEnd: _countingMode == 'gestures' ? (details) {
            if (details.primaryVelocity! < 0) _changeCount(1, 1);
            if (details.primaryVelocity! > 0) _changeCount(0, -1);
          } : null,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
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
                        onLongPress: () {
                          HapticFeedback.mediumImpact();
                          _showEditDialog('Capacity', _capacity, (val) {
                            setState(() => _capacity = val);
                            _saveState();
                          });
                        },
                        child: Text(
                          "Max: $_capacity",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  Expanded(flex: 6, child: _buildCounterCard("Entered", _entered, const Color(0xFF2196F3), 1, 1, Colors.white.withValues(alpha: 0.9))),
                  const SizedBox(height: 8),
                  Expanded(flex: 6, child: _buildCounterCard("Still Inside", _inside, const Color(0xFF4CAF50), 0, -1, insideColor)),
                  if (_countingMode == 'gestures')
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text("Swipe Up/Down to Count", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black54)),
                    ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ),
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
            if (label == 'Entered') {
              _entered = newValue;
            } else if (label == 'Still Inside') {
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
    if (_entries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No logs to export")));
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
            data: _entries.map((e) {
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
        final file = io.File('${directory.path}/Exodus_Report_${DateTime.now().millisecondsSinceEpoch}.pdf');
        await file.writeAsBytes(pdfBytes);
        await Share.shareXFiles([XFile(file.path)], text: 'Exodus Venue Report');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("PDF Export failed: $e")));
    }
  }

  void _showExportMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.grid_on),
            title: const Text("Export as CSV"),
            onTap: () {
              Navigator.pop(context);
              _exportCSV();
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text("Export as PDF"),
            onTap: () {
              Navigator.pop(context);
              _exportPDF();
            },
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text("Preview Report"),
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Log History'),
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
                  hintText: 'Search logs...',
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
            ? const Center(child: Text("No matches", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)))
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete entry?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(onPressed: () { _deleteEntry(index); Navigator.pop(context); }, child: const Text('Delete')),
        ],
      ),
    );
  }

  void _confirmDeleteAll() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete all entries?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(onPressed: () { _deleteAll(); Navigator.pop(context); }, child: const Text('Delete All', style: TextStyle(color: Colors.red))),
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
    return Scaffold(
      appBar: AppBar(title: Text('Report Preview: $locationName')),
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

  Future<pw.Document> _generateManualPDF() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(level: 0, child: pw.Text("EXODUS VENUE DASHBOARD: USER GUIDE")),
          pw.Header(level: 1, text: "1. OVERVIEW"),
          pw.Paragraph(
            text: "Exodus is a professional attendance monitoring tool. Its purpose is to track the flow of visitors through a specific entrance or exit. Unlike a standard 'clicker,' it manages two values simultaneously to provide a real-time view of venue safety and capacity.",
          ),
          pw.Bullet(text: "Entered: The cumulative total of all people who have passed through the gate. This number only goes up and represents the 'Total Flow.'"),
          pw.Bullet(text: "Still Inside: The current headcount remaining within the venue. This number goes up when people enter and down when they leave."),
          pw.Header(level: 1, text: "2. THE MAIN DASHBOARD (HOME SCREEN)"),
          pw.Paragraph(text: "This is the primary screen where the supervisor will spend 99% of their time."),
          pw.Bullet(text: "Branded Header: Features the Exodus logo. Long-pressing this logo provides a quick shortcut to the Help screen."),
          pw.Bullet(text: "Location Row: Displays the name of the current gate (e.g., 'North Entrance'). This ensures that if multiple phones are in use, the logs are correctly attributed."),
          pw.Bullet(text: "Capacity Row: Displays the 'Max Capacity' or safety limit for the area."),
          pw.Bullet(text: "Entered Card (Blue): Large display of the total entries."),
          pw.Bullet(text: "Still Inside Card (Green/White): Large display of the current headcount."),
          pw.Header(level: 1, text: "Visual Safety Indicators"),
          pw.Paragraph(text: "The Still Inside card uses a 'heat-map' logic to warn the supervisor of potential overcrowding without them having to read the numbers:"),
          pw.Bullet(text: "As the headcount approaches the Max Capacity, the card will smoothly transition from a neutral white to a graduated red."),
          pw.Bullet(text: "This warning begins when the remaining space is either 10 people or 2% of the total capacity (whichever is greater)."),
          pw.Bullet(text: "A deep red card is a signal to the supervisor to slow down or stop entries."),
          pw.Header(level: 1, text: "3. INPUT MODES (HOW TO COUNT)"),
          pw.Paragraph(text: "At the top of the dashboard, there are two icons to switch the input method based on the situation."),
          pw.Header(level: 2, text: "A. Button Mode (Icon: Tapping Finger)"),
          pw.Bullet(text: "Tap [+] on the blue card for an entry."),
          pw.Bullet(text: "Tap [-] on the green card for an exit."),
          pw.Bullet(text: "Best for: Steady, manageable traffic where high precision is required."),
          pw.Header(level: 2, text: "B. Swipe Mode (Icon: Swiping Hand)"),
          pw.Bullet(text: "Swipe UP anywhere on the screen to record an entry."),
          pw.Bullet(text: "Swipe DOWN anywhere on the screen to record an exit."),
          pw.Bullet(text: "Best for: Fast-moving crowds or 'rushes' where the supervisor needs to keep their eyes on the visitors rather than the screen."),
          pw.Header(level: 1, text: "4. CORRECTION AND NAVIGATION"),
          pw.Paragraph(text: "Mistakes happen, especially during busy shifts. Exodus provides two layers of correction:"),
          pw.Bullet(text: "Undo (Top-Left Icon): Tapping the curved arrow instantly reverts the very last action taken (count or edit)."),
          pw.Bullet(text: "Manual Edit (Keypad): Long-pressing either the Entered or Still Inside card opens a numeric keypad. This allows the supervisor to type in a confirmed headcount (e.g., after a manual floor check)."),
          pw.Header(level: 1, text: "5. LOG HISTORY AND REPORTING"),
          pw.Paragraph(text: "Every action is recorded with a timestamp. To access the log, tap the Gear Icon and select View Log, or use the Long-press shortcut on the Gear icon."),
          pw.Bullet(text: "Search: Use the bar at the top to filter for specific events like 'RESET' or 'MANUAL EDIT.'"),
          pw.Bullet(text: "Delete: Individual entries can be removed by long-pressing them (requires confirmation)."),
          pw.Bullet(text: "Exporting: You can share the logs as a CSV (for Excel) or a Formatted PDF."),
          pw.Bullet(text: "Preview: The 'Preview Report' option allows you to see the professional PDF layout before you send it via WhatsApp or Email."),
          pw.Header(level: 1, text: "6. SESSION MANAGEMENT"),
          pw.Header(level: 2, text: "Resetting the Day"),
          pw.Bullet(text: "To clear the counters for a new shift or event, select Reset Session from the Gear menu."),
          pw.Bullet(text: "The app will first ask if you want to Export the data so you don't lose the previous session's records."),
          pw.Bullet(text: "A final confirmation is required before the app wipes the counters to 0 and clears the log history."),
          pw.Header(level: 2, text: "Shutdown"),
          pw.Bullet(text: "Selecting Shutdown creates a final log entry to close the digital paper trail and exits the app cleanly."),
          pw.SizedBox(height: 20),
          pw.Footer(
            leading: pw.Text("© 2024 GoGetGo Exodus", style: const pw.TextStyle(fontSize: 10)),
          ),
        ],
      ),
    );
    return pdf;
  }

  Future<pw.Document> _generateInstallationGuidePDF() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Header(level: 0, child: pw.Text("EXODUS VENUE: INSTALLATION GUIDE")),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Installation on mobile phones"),
          pw.Header(level: 2, text: "Edge Mobile"),
          pw.Bullet(text: "Open the website in Edge: https://RobiTobiGoGetGo.github.io/exodus_venue/"),
          pw.Bullet(text: "Tap the three horizontal lines or three dots in the bottom right corner."),
          pw.Bullet(text: "Swipe up (or sideways) on the menu that appears to see more options."),
          pw.Bullet(text: "Look for and tap Add to phone (it might also say Install app or Add to Home screen)."),
          pw.Bullet(text: "Follow the prompts to confirm the name \"Exodus Venue\" and tap Add."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Firefox Mobile"),
          pw.Text("Android:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: "Open the website in Firefox: https://RobiTobiGoGetGo.github.io/exodus_venue/"),
          pw.Bullet(text: "Tap the three dots (menu) next to the address bar (usually at the bottom or top)."),
          pw.Bullet(text: "Tap Install."),
          pw.Bullet(text: "Confirm by tapping Add or Install again."),
          pw.SizedBox(height: 5),
          pw.Text("iPhone/iOS:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Paragraph(text: "Firefox on iOS does not have a direct \"Install\" button due to Apple's restrictions. You have to use the system menu:"),
          pw.Bullet(text: "Open the website in Firefox."),
          pw.Bullet(text: "Tap the Share icon (the square with an arrow pointing up) in the address bar."),
          pw.Bullet(text: "Scroll down the list of options and tap Add to Home Screen."),
          pw.Bullet(text: "Tap Add in the top right corner."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Chrome Mobile"),
          pw.Text("Android:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: "Open the website in Chrome: https://RobiTobiGoGetGo.github.io/exodus_venue/"),
          pw.Bullet(text: "Tap the three dots in the top-right corner."),
          pw.Bullet(text: "Tap Add to Home screen (on some versions, it may say Install app)."),
          pw.Bullet(text: "Tap Add or Install to confirm."),
          pw.SizedBox(height: 5),
          pw.Text("iPhone/iOS:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: "Open the website in Chrome."),
          pw.Bullet(text: "Tap the Share icon (the square with an arrow pointing up) next to the address bar."),
          pw.Bullet(text: "Scroll down and tap Add to Home Screen."),
          pw.Bullet(text: "Tap Add in the top right."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Desktop (Windows/Mac)"),
          pw.Bullet(text: "Open the website in Chrome."),
          pw.Bullet(text: "Click the three dots in the top-right corner."),
          pw.Bullet(text: "Select Save and Share."),
          pw.Bullet(text: "Click Install page as app..."),
          pw.Bullet(text: "Click Install"),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "For Safari on iPhone & iPad (iOS)"),
          pw.Bullet(text: "Open the website in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/"),
          pw.Bullet(text: "Tap the Share button at the bottom (the square with an arrow pointing up)."),
          pw.Bullet(text: "Scroll down the menu and tap Add to Home Screen."),
          pw.Bullet(text: "Tap Add in the top-right corner."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "For Safari on Mac (macOS)"),
          pw.Text("Note: This requires macOS Sonoma or later.", style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
          pw.Bullet(text: "Open the website in Safari."),
          pw.Bullet(text: "Go to the File menu in the top menu bar."),
          pw.Bullet(text: "Select Add to Dock..."),
          pw.Bullet(text: "Click Add."),
          pw.NewPage(),
          pw.Header(level: 0, child: pw.Text("EXODUS VENUE: INSTALLATIONSANLEITUNG")),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Installation auf Handys"),
          pw.Header(level: 2, text: "Edge Mobile"),
          pw.Bullet(text: "Öffnen Sie die Website in Edge: https://RobiTobiGoGetGo.github.io/exodus_venue/"),
          pw.Bullet(text: "Tippen Sie auf die drei horizontalen Linien (das Menü-Symbol) oder die drei Punkte in der unteren rechten Ecke."),
          pw.Bullet(text: "Wischen Sie im Menü nach oben (oder zur Seite), um weitere Optionen anzuzeigen."),
          pw.Bullet(text: "Suchen Sie nach Zum Telefon hinzufügen (manchmal steht dort auch App installieren oder Zum Startbildschirm hinzufügen) und tippen Sie darauf."),
          pw.Bullet(text: "Bestätigen Sie den Namen „Exodus Venue“ und tippen Sie auf Hinzufügen."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Firefox Mobile"),
          pw.Text("Android:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: "Öffnen Sie die Website in Firefox: https://RobiTobiGoGetGo.github.io/exodus_venue/"),
          pw.Bullet(text: "Tippen Sie auf die drei Punkte (Menü) neben der Adressleiste (normalerweise oben oder unten)."),
          pw.Bullet(text: "Tippen Sie auf Installieren."),
          pw.Bullet(text: "Bestätigen Sie, indem Sie erneut auf Hinzufügen oder Installieren tippen."),
          pw.SizedBox(height: 5),
          pw.Text("iPhone/iOS:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Paragraph(text: "Firefox unter iOS bietet aufgrund von Einschränkungen seitens Apple keine direkte Schaltfläche „Installieren“. Sie müssen das Systemmenü verwenden:"),
          pw.Bullet(text: "Öffnen Sie die Website in Firefox."),
          pw.Bullet(text: "Tippen Sie auf das Teilen-Symbol (das Quadrat mit dem Pfeil nach oben) in der Adressleiste."),
          pw.Bullet(text: "Scrollen Sie in der Liste nach unten und tippen Sie auf Zum Home-Bildschirm."),
          pw.Bullet(text: "Tippen Sie oben rechts auf Hinzufügen."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Chrome Mobile"),
          pw.Text("Android:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: "Öffnen Sie die Website in Chrome: https://RobiTobiGoGetGo.github.io/exodus_venue/"),
          pw.Bullet(text: "Tippen Sie auf die drei Punkte in der oberen rechten Ecke."),
          pw.Bullet(text: "Tippen Sie auf Zum Startbildschirm hinzufügen (in einigen Versionen heißt es App installieren)."),
          pw.Bullet(text: "Tippen Sie zur Bestätigung auf Hinzufügen oder Installieren."),
          pw.SizedBox(height: 5),
          pw.Text("iPhone/iOS:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: "Öffnen Sie die Website in Chrome."),
          pw.Bullet(text: "Tippen Sie auf das Teilen-Symbol (das Quadrat mit dem Pfeil nach oben) neben der Adressleiste."),
          pw.Bullet(text: "Scrollen Sie nach unten und tippen Sie auf Zum Home-Bildschirm."),
          pw.Bullet(text: "Tippen Sie oben rechts auf Hinzufügen."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Desktop (Windows/Mac)"),
          pw.Bullet(text: "Öffnen Sie die Website in Chrome."),
          pw.Bullet(text: "Klicken Sie auf die drei Punkte in der oberen rechten Ecke."),
          pw.Bullet(text: "Wählen Sie Speichern und teilen."),
          pw.Bullet(text: "Klicken Sie auf Seite als App installieren...."),
          pw.Bullet(text: "Klicken Sie auf Installieren."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Safari auf dem iPhone & iPad (iOS)"),
          pw.Bullet(text: "Öffnen Sie die Website in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/"),
          pw.Bullet(text: "Tippen Sie auf die Teilen-Taste am unteren Bildschirmrand (das Quadrat mit dem Pfeil nach oben)."),
          pw.Bullet(text: "Scrollen Sie im Menü nach unten und tippen Sie auf Zum Home-Bildschirm."),
          pw.Bullet(text: "Tippen Sie oben rechts auf Hinzufügen."),
          pw.SizedBox(height: 10),
          pw.Header(level: 1, text: "Safari auf dem Mac (macOS)"),
          pw.Text("Hinweis: Erfordert macOS Sonoma oder neuer.", style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
          pw.Bullet(text: "Öffnen Sie die Website in Safari."),
          pw.Bullet(text: "Klicken Sie in der Menüleiste am oberen Bildschirmrand auf Ablage."),
          pw.Bullet(text: "Wählen Sie Zum Dock hinzufügen...."),
          pw.Bullet(text: "Klicken Sie zur Bestätigung auf Hinzufügen."),
        ],
      ),
    );
    return pdf;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Help & Info'),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.picture_as_pdf, color: Colors.blue),
              tooltip: 'Export Manual as PDF',
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(
                  locationName: "User Manual",
                  docBuilder: _generateManualPDF,
                )));
              },
            ),
            IconButton(
              icon: const Icon(Icons.install_mobile, color: Colors.green),
              tooltip: 'Export Installation Guide',
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(
                  locationName: "Installation Guide",
                  docBuilder: _generateInstallationGuidePDF,
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
                  const Text(
                    "EXODUS VENUE DASHBOARD: USER GUIDE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1976D2)),
                  ),
                  const Text(
                    "Version 1.0.0+1",
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  _buildHelpSection("1. OVERVIEW", "Exodus is a professional attendance monitoring tool. Its purpose is to track the flow of visitors through a specific entrance or exit. Unlike a standard 'clicker,' it manages two values simultaneously to provide a real-time view of venue safety and capacity.\n\n- Entered: The cumulative total of all people who have come through the gate. This number only goes up and represents the 'Total Flow.'\n- Still Inside: The current headcount remaining within the venue. This number goes up when people enter and down when they leave."),
                  _buildHelpSection("2. THE MAIN DASHBOARD (HOME SCREEN)", "This is the primary screen where the supervisor will spend 99% of their time.\n\n- Branded Header: Features the Exodus logo. Long-pressing this logo provides a quick shortcut to the Help screen.\n- Location Row: Displays the name of the current gate (e.g., 'North Entrance').\n- Capacity Row: Displays the 'Max Capacity' or safety limit for the area.\n- Entered Card (Blue): Large display of the total entries.\n- Still Inside Card (Green/White): Large display of the current headcount.\n\nVisual Safety Indicators:\nThe Still Inside card uses a 'heat-map' logic to warn of potential overcrowding:\n- As headcount approaches Max Capacity, the card smoothly transitions from white to a graduated red.\n- This warning begins when remaining space is either 10 people or 2% of total capacity (whichever is greater).\n- A deep red card signal to stop entries."),
                  _buildHelpSection("3. INPUT MODES (HOW TO COUNT)", "At the top of the dashboard, use the icons to switch methods:\n\nA. Button Mode (Icon: Tapping Finger)\n- Tap [+] on the blue card for an entry.\n- Tap [-] on the green card for an exit.\n- Best for: Steady, manageable traffic.\n\nB. Swipe Mode (Icon: Swiping Hand)\n- Swipe UP anywhere on the screen to record an entry.\n- Swipe DOWN anywhere on the screen to record an exit.\n- Best for: Fast-moving crowds or 'rushes.'"),
                  _buildHelpSection("4. CORRECTION AND NAVIGATION", "Exodus provides two layers of correction:\n\n- Undo (Top-Left Icon): Instantly reverts the very last action taken.\n- Manual Edit (Keypad): Long-pressing either counter card to open the numeric keypad to type in a confirmed headcount."),
                  _buildHelpSection("5. LOG HISTORY AND REPORTING", "Every action is recorded with a timestamp. Access via Gear Icon > View Log (or Long-press Gear).\n\n- Search: Filter for specific events like 'RESET' or 'MANUAL EDIT.'\n- Delete: Remove individual entries (requires confirmation).\n- Exporting: Share logs as a CSV or Formatted PDF.\n- Preview: Check the PDF layout before sending via WhatsApp or Email."),
                  _buildHelpSection("6. SESSION MANAGEMENT", "Resetting the Day:\n- Select 'Reset Session' from the Gear menu. The app will prompt to export data first so you don't lose it.\n- Final confirmation wipes counters to 0 and clears logs.\n\nShutdown:\n- Select 'Shutdown' to log the end of the session and exit the app cleanly."),
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
