// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get nothingToUndo => 'Nichts rückgängig zu machen!';

  @override
  String get noMatches => 'Keine Treffer gefunden.';

  @override
  String get logNow => 'Jetzt protokollieren';

  @override
  String get loggedCurrentTotals => 'Aktuelle Summen protokolliert.';

  @override
  String get viewLog => 'Protokoll anzeigen';

  @override
  String get viewErrorLog => 'Fehlerprotokoll anzeigen';

  @override
  String get exportLogs => 'Protokolle exportieren';

  @override
  String get exportErrors => 'Fehlerprotokoll exportieren';

  @override
  String get helpAndInfo => 'Hilfe & Info';

  @override
  String get resetSession => 'Sitzung zurücksetzen';

  @override
  String get setLocation => 'Ort festlegen';

  @override
  String get shutdown => 'Beenden';

  @override
  String get closeSession => 'Sitzung schließen';

  @override
  String get sessionClosed => 'Sitzung geschlossen und protokolliert.';

  @override
  String get exportAsCSV => 'Als CSV exportieren';

  @override
  String get exportAsPDF => 'Als PDF exportieren';

  @override
  String get previewReport => 'Berichtvorschau';

  @override
  String get resetSessionQuestion => 'Sitzung zurücksetzen?';

  @override
  String get resetSessionContent =>
      'Möchten Sie die Zähler und das Protokoll zurücksetzen oder zuerst exportieren?';

  @override
  String get justReset => 'Nur zurücksetzen';

  @override
  String get exportFirst => 'Zuerst exportieren';

  @override
  String get confirmFullReset => 'Vollständiges Zurücksetzen bestätigen';

  @override
  String get confirmResetContent =>
      'Dadurch wird das aktuelle Sitzungsprotokoll dauerhaft gelöscht und die Zähler auf Null zurückgesetzt. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get sessionResetSuccess => 'Sitzung erfolgreich zurückgesetzt.';

  @override
  String get resetEverything => 'ALLES ZURÜCKSETZEN';

  @override
  String get setLocationName => 'Ortsnamen festlegen';

  @override
  String get locationNameHint => 'z. B. Haupteingang';

  @override
  String get save => 'Speichern';

  @override
  String get clear => 'LÖSCHEN';

  @override
  String get ok => 'OK';

  @override
  String get stillInside => 'Noch drin';

  @override
  String get entered => 'Eingetreten';

  @override
  String get validationExceedEntered =>
      'Anzahl \'Noch drin\' darf \'Eingetreten\' nicht überschreiten!';

  @override
  String get validationLessInside =>
      'Anzahl \'Eingetreten\' darf nicht kleiner als \'Noch drin\' sein!';

  @override
  String get capacity => 'Kapazität';

  @override
  String get swipeToCount => 'Zum Zählen nach oben/unten wischen';

  @override
  String get search => 'Suchen';

  @override
  String get deleteEntryQuestion => 'Diesen Eintrag löschen?';

  @override
  String get deleteErrorQuestion => 'Diesen Fehlereintrag löschen?';

  @override
  String get delete => 'Löschen';

  @override
  String get deleteAllEntriesQuestion => 'ALLE Einträge löschen?';

  @override
  String get deleteAllErrorsQuestion => 'ALLE Fehlereinträge löschen?';

  @override
  String get thisCannotBeUndone => 'Dies kann nicht rückgängig gemacht werden.';

  @override
  String get deleteAll => 'ALLE LÖSCHEN';

  @override
  String get userGuideTitle => 'Exodus Benutzerhandbuch';

  @override
  String get guideOverviewTitle => '1. Überblick';

  @override
  String get guideOverviewContent =>
      'Exodus ist ein professionelles Werkzeug für das Einlassmanagement von Veranstaltungsorten. Es verfolgt zwei Hauptzahlen:';

  @override
  String get guideOverviewEntered =>
      'Gesamt Eingetreten: Kumulierte Anzahl aller Personen, die eingetreten sind.';

  @override
  String get guideOverviewInside =>
      'Noch drin: Aktuelle Anzahl der Personen, die sich noch im Veranstaltungsort befinden.';

  @override
  String get guideDashboardTitle => '2. Das Dashboard';

  @override
  String get guideDashboardContent =>
      'Der Hauptbildschirm bietet Informationen in Echtzeit:';

  @override
  String get guideDashboardHeader =>
      'Header: Zeigt das Logo des Veranstaltungsorts. Lange drücken, um dieses Benutzerhandbuch zu öffnen.';

  @override
  String get guideDashboardLocation =>
      'Ort: Der Punkt des Einlasses in den Veranstaltungsort wird unter dem Logo angezeigt. Lange drücken, um ihn umzubenennen.';

  @override
  String get guideDashboardCapacity =>
      'Kapazität: Wird neben dem Ort angezeigt. Lange drücken zum Bearbeiten.';

  @override
  String get guideDashboardEnteredCard =>
      'Karte Eingetreten (Blau): Zeigt die Gesamtzahl der Einlässe an.';

  @override
  String get guideDashboardInsideCard =>
      'Karte Noch drin (Grün): Zeigt die aktuelle Personenzahl im Veranstaltungsort an.';

  @override
  String get guideSafetyTitle => '3. Kapazität & Sicherheit';

  @override
  String get guideSafetyContent => 'Die App überwacht Sicherheitsgrenzwerte:';

  @override
  String get guideSafetyTransition =>
      'Die Karte \'Noch drin\' färbt sich rot, wenn die Kapazitätsgrenze erreicht wird.';

  @override
  String get guideSafetyThreshold =>
      'Warnung beginnt bei 2% oder 10 Personen vor dem Limit.';

  @override
  String get guideSafetySignal =>
      'Eine vollständig rote Karte zeigt an, dass der Veranstaltungsort ausgelastet oder überfüllt ist.';

  @override
  String get guideInputTitle => '4. Eingabemethoden';

  @override
  String get guideInputContent =>
      'Wechseln Sie zwischen Tasten- und Wischmodus mit den Symbolen direkt über den Zählerkarten:';

  @override
  String get guideInputButtonTitle => 'Tastenmodus (Standard)';

  @override
  String get guideInputButtonTapEntered =>
      'Tippen Sie auf [+], um beide Zähler zu erhöhen (Person tritt ein).';

  @override
  String get guideInputButtonTapInside =>
      'Tippen Sie auf [-], um \'Noch drin\' zu verringern (Person verlässt den Ort).';

  @override
  String get guideInputButtonBestFor =>
      'Bestens geeignet für: Hochpräzises Zählen an festen Toren.';

  @override
  String get guideInputSwipeTitle => 'Wischmodus (Geste)';

  @override
  String get guideInputSwipeUp =>
      'Wischen Sie an einer beliebigen Stelle nach oben, um beide Zähler zu erhöhen.';

  @override
  String get guideInputSwipeDown =>
      'Wischen Sie an einer beliebigen Stelle nach unten, um \'Noch drin\' zu verringern.';

  @override
  String get guideInputSwipeBestFor =>
      'Bestens geeignet für: Schnelle Einlasskontrolle, bei der die Augen auf der Menge bleiben müssen.';

  @override
  String get guideCorrectionTitle => '5. Korrekturen';

  @override
  String get guideCorrectionContent =>
      'Fehler können auf zwei Arten korrigiert werden:';

  @override
  String get guideCorrectionUndo =>
      'Rückgängig: Tippen Sie auf das halbkreisförmige Rückwärtspfeil-Symbol oben links, um die letzte Aktion rückgängig zu machen.';

  @override
  String get guideCorrectionManual =>
      'Manuelle Bearbeitung: Drücken Sie lange auf eine Zahl auf dem Dashboard, um einen bestimmten Wert über das sichere Tastenfeld einzugeben.';

  @override
  String get guideLogTitle => '6. Protokoll & Berichterstattung';

  @override
  String get guideLogContent =>
      'Jede Protokollaktion wird mit einem Zeitstempel versehen, ebenso wie der Grund für die Änderung und die aktuellen Zählerstände:';

  @override
  String get guideLogSearch =>
      'Suche: Verwenden Sie die Lupe, um bestimmte Ereignisse zu finden (z. B. \'MANUAL\').';

  @override
  String get guideLogDelete =>
      'Löschen: Drücken Sie lange auf einen Protokolleintrag, um ihn zu entfernen.';

  @override
  String get guideLogExport =>
      'Exportieren: Verwenden Sie das Teilen-Symbol, um PDF-Berichte oder CSV-Tabellen zu erstellen.';

  @override
  String get guideLogPreview =>
      'Vorschau: Zeigen Sie das Berichtslayout an, bevor Sie es teilen.';

  @override
  String get guideSessionTitle => '7. Sitzungsverwaltung';

  @override
  String get guideSessionResetTitle => 'Sitzung zurücksetzen';

  @override
  String get guideSessionResetContent =>
      'Löscht alle Daten, um ganz von vorne zu beginnen.';

  @override
  String get guideSessionResetExport =>
      'Die App fragt, ob das Protokoll exportiert werden soll, bevor die Daten gelöscht werden.';

  @override
  String get guideSessionResetConfirm =>
      'Erfordert eine doppelte Bestätigung, um versehentlichen Verlust zu verhindern.';

  @override
  String get guideSessionShutdownTitle => 'Beenden';

  @override
  String get guideSessionShutdownContent =>
      'Protokolliert das Ende der Arbeit ordnungsgemäß und beendet die Anwendung.';

  @override
  String get installGuideTitle => 'Exodus Venue: Installationsanleitung';

  @override
  String get installMobileTitle => 'Installation auf dem Mobiltelefon';

  @override
  String get installEdgeTitle => 'Edge Mobile';

  @override
  String get installEdgeStep1 =>
      'Öffnen Sie die Website in Edge: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installEdgeStep2 =>
      'Tippen Sie auf die drei horizontalen Linien oder die drei Punkte unten rechts.';

  @override
  String get installEdgeStep3 =>
      'Wischen Sie im erscheinenden Menü nach oben (oder zur Seite), um weitere Optionen zu sehen.';

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
      'Bestätigen Sie durch Tippen auf Hinzufügen oder erneut auf Installieren.';

  @override
  String get installIos => 'iPhone/iOS:';

  @override
  String get installFirefoxIosContent =>
      'Firefox auf iOS hat aufgrund von Apple-Beschränkungen keine direkte Schaltfläche \"Installieren\". Sie müssen das Systemmenü verwenden:';

  @override
  String get installFirefoxIosStep1 => 'Öffnen Sie die Website in Firefox.';

  @override
  String get installFirefoxIosStep2 =>
      'Tippen Sie auf das Teilen-Symbol (Quadrat mit einem Pfeil nach oben) in der Adressleiste.';

  @override
  String get installFirefoxIosStep3 =>
      'Scrollen Sie durch die Liste der Optionen und tippen Sie auf Zum Home-Bildschirm hinzufügen.';

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
      'Tippen Sie auf Zum Startbildschirm hinzufügen (in einigen Versionen heißt es möglicherweise App installieren).';

  @override
  String get installChromeAndroidStep4 =>
      'Tippen Sie zur Bestätigung auf Hinzufügen oder Installieren.';

  @override
  String get installChromeIosStep1 => 'Öffnen Sie die Website in Chrome.';

  @override
  String get installChromeIosStep2 =>
      'Tippen Sie auf das Teilen-Symbol (Quadrat mit einem Pfeil nach oben) neben der Adressleiste.';

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
      'Klicken Sie auf die drei Punkte oben rechts.';

  @override
  String get installDesktopStep3 => 'Wählen Sie Speichern und teilen.';

  @override
  String get installDesktopStep4 =>
      'Klicken Sie auf Seite als App installieren...';

  @override
  String get installDesktopStep5 => 'Klicken Sie auf Installieren.';

  @override
  String get installSafariIosTitle => 'For Safari auf iPhone und iPad (iOS)';

  @override
  String get installSafariIosStep1 =>
      'Öffnen Sie die Website in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installSafariIosStep2 =>
      'Tippen Sie unten auf die Schaltfläche Teilen (das Quadrat mit einem Pfeil nach oben).';

  @override
  String get installSafariIosStep3 =>
      'Scrollen Sie durch das Menü und tippen Sie auf Zum Home-Bildschirm hinzufügen.';

  @override
  String get installSafariIosStep4 => 'Tippen Sie oben rechts auf Hinzufügen.';

  @override
  String get installSafariMacTitle => 'For Safari auf Mac (macOS)';

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
