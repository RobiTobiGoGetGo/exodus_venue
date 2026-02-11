// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Exodus';

  @override
  String get entered => 'Eingetreten';

  @override
  String get stillInside => 'Noch Drinnen';

  @override
  String get capacity => 'Kapazität';

  @override
  String get resetSession => 'Sitzung zurücksetzen';

  @override
  String get exportLogs => 'Protokolle exportieren';

  @override
  String get helpAndInfo => 'Hilfe & Info';

  @override
  String get setLocation => 'Ort festlegen';

  @override
  String get shutdown => 'Beenden';

  @override
  String get closeSession => 'Sitzung schließen';

  @override
  String get logNow => 'JETZT protokollieren';

  @override
  String get viewLog => 'Protokoll anzeigen';

  @override
  String get exportAsCSV => 'Als CSV exportieren';

  @override
  String get exportAsPDF => 'Als PDF exportieren';

  @override
  String get previewReport => 'Berichtsvorschau';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get ok => 'OK';

  @override
  String get clear => 'CLR';

  @override
  String get nothingToUndo => 'Nichts zum Rückgängigmachen';

  @override
  String get loggedCurrentTotals => 'Aktuelle Summen protokolliert';

  @override
  String get sessionClosed => 'Sitzung geschlossen';

  @override
  String get resetEverything => 'Alles zurücksetzen';

  @override
  String get sessionResetSuccess => 'Sitzung erfolgreich zurückgesetzt';

  @override
  String get resetSessionQuestion => 'Sitzung zurücksetzen?';

  @override
  String get resetSessionContent =>
      'Möchten Sie das aktuelle Protokoll vor dem Zurücksetzen exportieren?';

  @override
  String get justReset => 'Nur zurücksetzen';

  @override
  String get exportFirst => 'Zuerst exportieren';

  @override
  String get confirmFullReset => 'Vollständiges Zurücksetzen bestätigen';

  @override
  String get confirmResetContent =>
      'Dies löscht ALLE Protokolle und setzt die Zähler auf Null zurück. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get setLocationName => 'Ortsnamen festlegen';

  @override
  String get locationNameHint => 'z.B. Haupteingang';

  @override
  String get validationExceedEntered =>
      'Darf \'Eingetreten\' nicht überschreiten';

  @override
  String get validationLessInside =>
      'Darf nicht weniger als \'Noch Drinnen\' sein';

  @override
  String get deleteEntryQuestion => 'Eintrag löschen?';

  @override
  String get delete => 'Löschen';

  @override
  String get deleteAllEntriesQuestion => 'Alle Einträge löschen?';

  @override
  String get thisCannotBeUndone => 'Dies kann nicht rückgängig gemacht werden.';

  @override
  String get deleteAll => 'Alle löschen';

  @override
  String get noMatches => 'Keine Treffer';

  @override
  String get search => 'Protokolle durchsuchen...';

  @override
  String get swipeToCount => 'Zum Zählen nach oben/unten wischen';

  @override
  String get userGuideTitle => 'EXODUS VENUE DASHBOARD: BEDIENUNGSANLEITUNG';

  @override
  String get guideOverviewTitle => '1. ÜBERSICHT';

  @override
  String get guideOverviewContent =>
      'Exodus ist ein professionelles Tool zur Anwesenheitsüberwachung. Sein Zweck ist es, den Besucherstrom durch einen bestimmten Ein- oder Ausgang zu verfolgen. Im Gegensatz zu einem Standard-\'Klicker\' verwaltet es zwei Werte gleichzeitig, um eine Echtzeitansicht der Sicherheit und Kapazität des Veranstaltungsortes zu ermöglichen.';

  @override
  String get guideOverviewEntered =>
      'Eingetreten: Die kumulierte Gesamtzahl aller Personen, die das Tor passiert haben. Diese Zahl steigt nur an und stellt den \'Gesamtfluss\' dar.';

  @override
  String get guideOverviewInside =>
      'Noch Drinnen: Die aktuelle Kopfzahl, die im Veranstaltungsort verbleibt. Diese Zahl steigt an, wenn Personen eintreten, und sinkt, wenn sie gehen.';

  @override
  String get guideDashboardTitle => '2. DAS HAUPTDASHBOARD (STARTBILDSCHIRM)';

  @override
  String get guideDashboardContent =>
      'Dies ist der Hauptbildschirm, auf dem der Supervisor 99% seiner Zeit verbringt.';

  @override
  String get guideDashboardHeader =>
      'Marken-Header: Enthält das Exodus-Logo. Langes Drücken auf dieses Logo bietet eine schnelle Verknüpfung zum Hilfe-Bildschirm.';

  @override
  String get guideDashboardLocation =>
      'Standortzeile: Zeigt den Namen des aktuellen Tors an (z. B. \'Nordeingang\'). Dies stellt sicher, dass bei Verwendung mehrerer Telefone die Protokolle korrekt zugeordnet werden.';

  @override
  String get guideDashboardCapacity =>
      'Kapazitätszeile: Zeigt die \'Max. Kapazität\' oder das Sicherheitslimit für den Bereich an.';

  @override
  String get guideDashboardEnteredCard =>
      'Eingetreten-Karte (Blau): Große Anzeige der Gesamteintritte.';

  @override
  String get guideDashboardInsideCard =>
      'Noch Drinnen-Karte (Grün/Weiß): Große Anzeige der aktuellen Kopfzahl.';

  @override
  String get guideSafetyTitle => 'Visuelle Sicherheitsindikatoren';

  @override
  String get guideSafetyContent =>
      'Die Noch Drinnen-Karte verwendet eine \'Heat-Map\'-Logik, um den Supervisor vor möglicher Überfüllung zu warnen, ohne dass er die Zahlen lesen muss:';

  @override
  String get guideSafetyTransition =>
      'Wenn sich die Kopfzahl der maximalen Kapazität nähert, geht die Karte fließend von einem neutralen Weiß in ein abgestuftes Rot über.';

  @override
  String get guideSafetyThreshold =>
      'Diese Warnung beginnt, wenn der verbleibende Platz entweder 10 Personen oder 2% der Gesamtkapazität beträgt (je nachdem, was größer ist).';

  @override
  String get guideSafetySignal =>
      'Eine tiefrote Karte ist ein Signal für den Supervisor, die Eintritte zu verlangsamen oder zu stoppen.';

  @override
  String get guideInputTitle => '3. EINGABEMODI (WIE GEZÄHLT WIRD)';

  @override
  String get guideInputContent =>
      'Oben auf dem Dashboard befinden sich zwei Symbole, um die Eingabemethode je nach Situation zu wechseln.';

  @override
  String get guideInputButtonTitle =>
      'A. Tastenmodus (Symbol: Tippender Finger)';

  @override
  String get guideInputButtonTapEntered =>
      'Tippen Sie auf [+] auf der blauen Karte für einen Eintritt.';

  @override
  String get guideInputButtonTapInside =>
      'Tippen Sie auf [-] auf der grünen Karte für einen Ausgang.';

  @override
  String get guideInputButtonBestFor =>
      'Bestens geeignet für: Gleichmäßigen, überschaubaren Verkehr, bei dem hohe Präzision erforderlich ist.';

  @override
  String get guideInputSwipeTitle => 'B. Wischmodus (Symbol: Wischende Hand)';

  @override
  String get guideInputSwipeUp =>
      'Wischen Sie an einer beliebigen Stelle auf dem Bildschirm nach OBEN, um einen Eintritt zu erfassen.';

  @override
  String get guideInputSwipeDown =>
      'Wischen Sie an einer beliebigen Stelle auf dem Bildschirm nach UNTEN, um einen Ausgang zu erfassen.';

  @override
  String get guideInputSwipeBestFor =>
      'Bestens geeignet für: Schnell fließende Menschenmengen oder \'Anstürme\', bei denen der Supervisor die Besucher im Auge behalten muss, anstatt auf den Bildschirm zu schauen.';

  @override
  String get guideCorrectionTitle => '4. KORREKTUR UND NAVIGATION';

  @override
  String get guideCorrectionContent =>
      'Fehler passieren, besonders in geschäftigen Schichten. Exodus bietet zwei Ebenen der Korrektur:';

  @override
  String get guideCorrectionUndo =>
      'Rückgängig (Symbol oben links): Durch Tippen auf den gebogenen Pfeil wird die allerletzte Aktion (Zählung oder Bearbeitung) sofort rückgängig gemacht.';

  @override
  String get guideCorrectionManual =>
      'Manuelle Bearbeitung (Tastenfeld): Langes Drücken auf die Eingetreten- oder Noch Drinnen-Karte öffnet ein numerisches Tastenfeld. Dies ermöglicht dem Supervisor, eine bestätigte Kopfzahl einzugeben (z. B. nach einer manuellen Überprüfung vor Ort).';

  @override
  String get guideLogTitle => '5. PROTOKOLLVERLAUF UND BERICHTERSTATTUNG';

  @override
  String get guideLogContent =>
      'Jede Aktion wird mit einem Zeitstempel aufgezeichnet. Um auf das Protokoll zuzugreifen, tippen Sie auf das Zahnradsymbol und wählen Sie Protokoll anzeigen, oder verwenden Sie das Tastenkürzel für langes Drücken auf das Zahnradsymbol.';

  @override
  String get guideLogSearch =>
      'Suche: Verwenden Sie die Leiste oben, um nach bestimmten Ereignissen wie \'RESET\' oder \'MANUAL EDIT\' zu filtern.';

  @override
  String get guideLogDelete =>
      'Löschen: Einzelne Einträge können durch langes Drücken entfernt werden (erfordert Bestätigung).';

  @override
  String get guideLogExport =>
      'Exportieren: Sie können die Protokolle als CSV (für Excel) oder formatiertes PDF teilen.';

  @override
  String get guideLogPreview =>
      'Vorschau: Die Option \'Berichtsvorschau\' ermöglicht es Ihnen, das professionelle PDF-Layout zu sehen, bevor Sie es über WhatsApp oder E-Mail versenden.';

  @override
  String get guideSessionTitle => '6. SITZUNGSVERWALTUNG';

  @override
  String get guideSessionResetTitle => 'Den Tag zurücksetzen';

  @override
  String get guideSessionResetContent =>
      'Um die Zähler für eine neue Schicht oder ein neues Ereignis zu löschen, wählen Sie Sitzung zurücksetzen aus dem Zahnradmenü.';

  @override
  String get guideSessionResetExport =>
      'Die App fragt zuerst, ob Sie die Daten exportieren möchten, damit Sie die Aufzeichnungen der vorherigen Sitzung nicht verlieren.';

  @override
  String get guideSessionResetConfirm =>
      'Eine endgültige Bestätigung ist erforderlich, bevor die App die Zähler auf 0 wischt und den Protokollverlauf löscht.';

  @override
  String get guideSessionShutdownTitle => 'Beenden';

  @override
  String get guideSessionShutdownContent =>
      'Das Auswählen von Beenden erstellt einen letzten Protokolleintrag, um den digitalen Pfad zu schließen, und beendet die App sauber.';

  @override
  String get installGuideTitle => 'EXODUS VENUE: INSTALLATIONSANLEITUNG';

  @override
  String get installMobileTitle => 'Installation auf Mobiltelefonen';

  @override
  String get installEdgeTitle => 'Edge Mobile';

  @override
  String get installEdgeStep1 =>
      'Öffnen Sie die Website in Edge: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installEdgeStep2 =>
      'Tippen Sie auf die drei horizontalen Linien oder drei Punkte in der unteren rechten Ecke.';

  @override
  String get installEdgeStep3 =>
      'Wischen Sie im angezeigten Menü nach oben (oder zur Seite), um weitere Optionen anzuzeigen.';

  @override
  String get installEdgeStep4 =>
      'Suchen und tippen Sie auf Zum Telefon hinzufügen (es könnte auch App installieren oder Zum Startbildschirm hinzufügen heißen).';

  @override
  String get installEdgeStep5 =>
      'Folgen Sie den Anweisungen, um den Namen \"Exodus Venue\" zu bestätigen, und tippen Sie auf Hinzufügen.';

  @override
  String get installFirefoxTitle => 'Firefox Mobile';

  @override
  String get installAndroid => 'Android:';

  @override
  String get installFirefoxStep1 =>
      'Öffnen Sie die Website in Firefox: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installFirefoxStep2 =>
      'Tippen Sie auf die drei Punkte (Menü) neben der Adressleiste (normalerweise unten oder oben).';

  @override
  String get installFirefoxStep3 => 'Tippen Sie auf Installieren.';

  @override
  String get installFirefoxStep4 =>
      'Bestätigen Sie durch Tippen auf Hinzufügen oder erneut Installieren.';

  @override
  String get installIos => 'iPhone/iOS:';

  @override
  String get installFirefoxIosContent =>
      'Firefox auf iOS hat aufgrund von Apples Einschränkungen keine direkte \"Installieren\"-Schaltfläche. Sie müssen das Systemmenü verwenden:';

  @override
  String get installFirefoxIosStep1 => 'Öffnen Sie die Website in Firefox.';

  @override
  String get installFirefoxIosStep2 =>
      'Tippen Sie auf das Teilen-Symbol (das Quadrat mit einem nach oben zeigenden Pfeil) in der Adressleiste.';

  @override
  String get installFirefoxIosStep3 =>
      'Scrollen Sie in der Liste der Optionen nach unten und tippen Sie auf Zum Home-Bildschirm hinzufügen.';

  @override
  String get installFirefoxIosStep4 => 'Tippen Sie oben rechts auf Hinzufügen.';

  @override
  String get installChromeTitle => 'Chrome Mobile';

  @override
  String get installChromeAndroidStep1 =>
      'Öffnen Sie die Website in Chrome: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installChromeAndroidStep2 =>
      'Tippen Sie auf die drei Punkte in der oberen rechten Ecke.';

  @override
  String get installChromeAndroidStep3 =>
      'Tippen Sie auf Zum Startbildschirm hinzufügen (bei einigen Versionen kann es App installieren heißen).';

  @override
  String get installChromeAndroidStep4 =>
      'Tippen Sie zur Bestätigung auf Hinzufügen oder Installieren.';

  @override
  String get installChromeIosStep1 => 'Öffnen Sie die Website in Chrome.';

  @override
  String get installChromeIosStep2 =>
      'Tippen Sie auf das Teilen-Symbol (das Quadrat mit einem nach oben zeigenden Pfeil) neben der Adressleiste.';

  @override
  String get installChromeIosStep3 =>
      'Scrollen Sie nach unten und tippen Sie auf Zum Home-Bildschirm hinzufügen.';

  @override
  String get installChromeIosStep4 => 'Tippen Sie oben rechts auf Hinzufügen.';

  @override
  String get installDesktopTitle => 'Desktop (Windows/Mac)';

  @override
  String get installDesktopStep1 => 'Öffnen Sie die Website in Chrome.';

  @override
  String get installDesktopStep2 =>
      'Klicken Sie auf die drei Punkte in der oberen rechten Ecke.';

  @override
  String get installDesktopStep3 => 'Wählen Sie Speichern und teilen.';

  @override
  String get installDesktopStep4 =>
      'Klicken Sie auf Seite als App installieren...';

  @override
  String get installDesktopStep5 => 'Klicken Sie auf Installieren';

  @override
  String get installSafariIosTitle => 'Für Safari auf iPhone & iPad (iOS)';

  @override
  String get installSafariIosStep1 =>
      'Öffnen Sie die Website in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installSafariIosStep2 =>
      'Tippen Sie auf die Teilen-Schaltfläche unten (das Quadrat mit einem nach oben zeigenden Pfeil).';

  @override
  String get installSafariIosStep3 =>
      'Scrollen Sie im Menü nach unten und tippen Sie auf Zum Home-Bildschirm hinzufügen.';

  @override
  String get installSafariIosStep4 => 'Tippen Sie oben rechts auf Hinzufügen.';

  @override
  String get installSafariMacTitle => 'Für Safari auf Mac (macOS)';

  @override
  String get installSafariMacNote =>
      'Hinweis: Dies erfordert macOS Sonoma oder neuer.';

  @override
  String get installSafariMacStep1 => 'Öffnen Sie die Website in Safari.';

  @override
  String get installSafariMacStep2 =>
      'Gehen Sie zum Menü Ablage in der oberen Menüleiste.';

  @override
  String get installSafariMacStep3 => 'Wählen Sie Zum Dock hinzufügen...';

  @override
  String get installSafariMacStep4 => 'Klicken Sie auf Hinzufügen.';
}
