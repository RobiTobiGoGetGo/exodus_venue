// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Exodus';

  @override
  String get entered => 'Entré';

  @override
  String get stillInside => 'Encore à l\'intérieur';

  @override
  String get capacity => 'Capacité';

  @override
  String get resetSession => 'Réinitialiser la session';

  @override
  String get exportLogs => 'Exporter les journaux';

  @override
  String get helpAndInfo => 'Aide et infos';

  @override
  String get setLocation => 'Définir l\'emplacement';

  @override
  String get shutdown => 'Éteindre';

  @override
  String get closeSession => 'Fermer la session';

  @override
  String get logNow => 'Enregistrer MAINTENANT';

  @override
  String get viewLog => 'Voir le journal';

  @override
  String get exportAsCSV => 'Exporter en CSV';

  @override
  String get exportAsPDF => 'Exporter en PDF';

  @override
  String get previewReport => 'Aperçu du rapport';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get ok => 'OK';

  @override
  String get clear => 'CLR';

  @override
  String get nothingToUndo => 'Rien à annuler';

  @override
  String get loggedCurrentTotals => 'Totaux actuels enregistrés';

  @override
  String get sessionClosed => 'Session fermée';

  @override
  String get resetEverything => 'Tout réinitialiser';

  @override
  String get sessionResetSuccess => 'Session réinitialisée avec succès';

  @override
  String get resetSessionQuestion => 'Réinitialiser la session ?';

  @override
  String get resetSessionContent =>
      'Souhaitez-vous exporter le journal actuel avant de réinitialiser ?';

  @override
  String get justReset => 'Juste réinitialiser';

  @override
  String get exportFirst => 'Exporter d\'abord';

  @override
  String get confirmFullReset => 'Confirmer la réinitialisation complète';

  @override
  String get confirmResetContent =>
      'Cela effacera TOUS les journaux et remettra les compteurs à zéro. Cette action est irréversible.';

  @override
  String get setLocationName => 'Définir le nom de l\'emplacement';

  @override
  String get locationNameHint => 'ex: Entrée principale';

  @override
  String get validationExceedEntered => 'Ne peut pas dépasser \'Entré\'';

  @override
  String get validationLessInside =>
      'Ne peut pas être inférieur à \'Encore à l\'intérieur\'';

  @override
  String get deleteEntryQuestion => 'Supprimer l\'entrée ?';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteAllEntriesQuestion => 'Supprimer toutes les entrées ?';

  @override
  String get thisCannotBeUndone => 'Cette action est irréversible.';

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get noMatches => 'Aucun résultat';

  @override
  String get search => 'Rechercher...';

  @override
  String get swipeToCount => 'Balayer vers le haut/bas pour compter';

  @override
  String get userGuideTitle => 'EXODUS VENUE DASHBOARD: USER GUIDE';

  @override
  String get guideOverviewTitle => '1. OVERVIEW';

  @override
  String get guideOverviewContent =>
      'Exodus is a professional attendance monitoring tool. Its purpose is to track the flow of visitors through a specific entrance or exit. Unlike a standard \'clicker,\' it manages two values simultaneously to provide a real-time view of venue safety and capacity.';

  @override
  String get guideOverviewEntered =>
      'Entered: The cumulative total of all people who have passed through the gate. This number only goes up and represents the \'Total Flow.\'';

  @override
  String get guideOverviewInside =>
      'Still Inside: The current headcount remaining within the venue. This number goes up when people enter and down when they leave.';

  @override
  String get guideDashboardTitle => '2. THE MAIN DASHBOARD (HOME SCREEN)';

  @override
  String get guideDashboardContent =>
      'This is the primary screen where the supervisor will spend 99% of their time.';

  @override
  String get guideDashboardHeader =>
      'Branded Header: Features the Exodus logo. Long-pressing this logo provides a quick shortcut to the Help screen.';

  @override
  String get guideDashboardLocation =>
      'Location Row: Displays the name of the current gate (e.g., \'North Entrance\'). This ensures that if multiple phones are in use, the logs are correctly attributed.';

  @override
  String get guideDashboardCapacity =>
      'Capacity Row: Displays the \'Max Capacity\' or safety limit for the area.';

  @override
  String get guideDashboardEnteredCard =>
      'Entered Card (Blue): Large display of the total entries.';

  @override
  String get guideDashboardInsideCard =>
      'Still Inside Card (Green/White): Large display of the current headcount.';

  @override
  String get guideSafetyTitle => 'Visual Safety Indicators';

  @override
  String get guideSafetyContent =>
      'The Still Inside card uses a \'heat-map\' logic to warn the supervisor of potential overcrowding without them having to read the numbers:';

  @override
  String get guideSafetyTransition =>
      'As the headcount approaches the Max Capacity, the card will smoothly transition from a neutral white to a graduated red.';

  @override
  String get guideSafetyThreshold =>
      'This warning begins when the remaining space is either 10 people or 2% of the total capacity (whichever is greater).';

  @override
  String get guideSafetySignal =>
      'A deep red card is a signal to the supervisor to slow down or stop entries.';

  @override
  String get guideInputTitle => '3. INPUT MODES (HOW TO COUNT)';

  @override
  String get guideInputContent =>
      'At the top of the dashboard, there are two icons to switch the input method based on the situation.';

  @override
  String get guideInputButtonTitle => 'A. Button Mode (Icon: Tapping Finger)';

  @override
  String get guideInputButtonTapEntered =>
      'Tap [+] on the blue card for an entry.';

  @override
  String get guideInputButtonTapInside =>
      'Tap [-] on the green card for an exit.';

  @override
  String get guideInputButtonBestFor =>
      'Best for: Steady, manageable traffic where high precision is required.';

  @override
  String get guideInputSwipeTitle => 'B. Swipe Mode (Icon: Swiping Hand)';

  @override
  String get guideInputSwipeUp =>
      'Swipe UP anywhere on the screen to record an entry.';

  @override
  String get guideInputSwipeDown =>
      'Swipe DOWN anywhere on the screen to record an exit.';

  @override
  String get guideInputSwipeBestFor =>
      'Best for: Fast-moving crowds or \'rushes\' where the supervisor needs to keep their eyes on the visitors rather than the screen.';

  @override
  String get guideCorrectionTitle => '4. CORRECTION AND NAVIGATION';

  @override
  String get guideCorrectionContent =>
      'Mistakes happen, especially during busy shifts. Exodus provides two layers of correction:';

  @override
  String get guideCorrectionUndo =>
      'Undo (Top-Left Icon): Tapping the curved arrow instantly reverts the very last action taken (count or edit).';

  @override
  String get guideCorrectionManual =>
      'Manual Edit (Keypad): Long-pressing either the Entered or Still Inside card opens a numeric keypad. This allows the supervisor to type in a confirmed headcount (e.g., after a manual floor check).';

  @override
  String get guideLogTitle => '5. LOG HISTORY AND REPORTING';

  @override
  String get guideLogContent =>
      'Every action is recorded with a timestamp. To access the log, tap the Gear Icon and select View Log, or use the Long-press shortcut on the Gear icon.';

  @override
  String get guideLogSearch =>
      'Search: Use the bar at the top to filter for specific events like \'RESET\' or \'MANUAL EDIT.\'';

  @override
  String get guideLogDelete =>
      'Delete: Individual entries can be removed by long-pressing them (requires confirmation).';

  @override
  String get guideLogExport =>
      'Exporting: You can share the logs as a CSV (for Excel) or a Formatted PDF.';

  @override
  String get guideLogPreview =>
      'Preview: The \'Preview Report\' option allows you to see the professional PDF layout before you send it via WhatsApp or Email.';

  @override
  String get guideSessionTitle => '6. SESSION MANAGEMENT';

  @override
  String get guideSessionResetTitle => 'Resetting the Day';

  @override
  String get guideSessionResetContent =>
      'To clear the counters for a new shift or event, select Reset Session from the Gear menu.';

  @override
  String get guideSessionResetExport =>
      'The app will first ask if you want to Export the data so you don\'t lose the previous session\'s records.';

  @override
  String get guideSessionResetConfirm =>
      'A final confirmation is required before the app wipes the counters to 0 and clears the log history.';

  @override
  String get guideSessionShutdownTitle => 'Shutdown';

  @override
  String get guideSessionShutdownContent =>
      'Selecting Shutdown creates a final log entry to close the digital paper trail and exits the app cleanly.';

  @override
  String get installGuideTitle => 'EXODUS VENUE: INSTALLATION GUIDE';

  @override
  String get installMobileTitle => 'Installation on mobile phones';

  @override
  String get installEdgeTitle => 'Edge Mobile';

  @override
  String get installEdgeStep1 =>
      'Open the website in Edge: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installEdgeStep2 =>
      'Tap the three horizontal lines or three dots in the bottom right corner.';

  @override
  String get installEdgeStep3 =>
      'Swipe up (or sideways) on the menu that appears to see more options.';

  @override
  String get installEdgeStep4 =>
      'Look for and tap Add to phone (it might also say Install app or Add to Home screen).';

  @override
  String get installEdgeStep5 =>
      'Follow the prompts to confirm the name \"Exodus Venue\" and tap Add.';

  @override
  String get installFirefoxTitle => 'Firefox Mobile';

  @override
  String get installAndroid => 'Android:';

  @override
  String get installFirefoxStep1 =>
      'Open the website in Firefox: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installFirefoxStep2 =>
      'Tap the three dots (menu) next to the address bar (usually at the bottom or top).';

  @override
  String get installFirefoxStep3 => 'Tap Install.';

  @override
  String get installFirefoxStep4 => 'Confirm by tapping Add or Install again.';

  @override
  String get installIos => 'iPhone/iOS:';

  @override
  String get installFirefoxIosContent =>
      'Firefox on iOS does not have a direct \"Install\" button due to Apple\'s restrictions. You have to use the system menu:';

  @override
  String get installFirefoxIosStep1 => 'Open the website in Firefox.';

  @override
  String get installFirefoxIosStep2 =>
      'Tap the Share icon (the square with an arrow pointing up) in the address bar.';

  @override
  String get installFirefoxIosStep3 =>
      'Scroll down the list of options and tap Add to Home Screen.';

  @override
  String get installFirefoxIosStep4 => 'Tap Add in the top right corner.';

  @override
  String get installChromeTitle => 'Chrome Mobile';

  @override
  String get installChromeAndroidStep1 =>
      'Open the website in Chrome: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installChromeAndroidStep2 =>
      'Tap the three dots in the top-right corner.';

  @override
  String get installChromeAndroidStep3 =>
      'Tap Add to Home screen (on some versions, it may say Install app).';

  @override
  String get installChromeAndroidStep4 => 'Tap Add or Install to confirm.';

  @override
  String get installChromeIosStep1 => 'Open the website in Chrome.';

  @override
  String get installChromeIosStep2 =>
      'Tap the Share icon (the square with an arrow pointing up) next to the address bar.';

  @override
  String get installChromeIosStep3 => 'Scroll down and tap Add to Home Screen.';

  @override
  String get installChromeIosStep4 => 'Tap Add in the top right.';

  @override
  String get installDesktopTitle => 'Desktop (Windows/Mac)';

  @override
  String get installDesktopStep1 => 'Open the website in Chrome.';

  @override
  String get installDesktopStep2 =>
      'Click the three dots in the top-right corner.';

  @override
  String get installDesktopStep3 => 'Select Save and Share.';

  @override
  String get installDesktopStep4 => 'Click Install page as app...';

  @override
  String get installDesktopStep5 => 'Click Install';

  @override
  String get installSafariIosTitle => 'For Safari on iPhone & iPad (iOS)';

  @override
  String get installSafariIosStep1 =>
      'Open the website in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installSafariIosStep2 =>
      'Tap the Share button at the bottom (the square with an arrow pointing up).';

  @override
  String get installSafariIosStep3 =>
      'Scroll down the menu and tap Add to Home Screen.';

  @override
  String get installSafariIosStep4 => 'Tap Add in the top-right corner.';

  @override
  String get installSafariMacTitle => 'For Safari on Mac (macOS)';

  @override
  String get installSafariMacNote =>
      'Note: This requires macOS Sonoma or later.';

  @override
  String get installSafariMacStep1 => 'Open the website in Safari.';

  @override
  String get installSafariMacStep2 =>
      'Go to the File menu in the top menu bar.';

  @override
  String get installSafariMacStep3 => 'Select Add to Dock...';

  @override
  String get installSafariMacStep4 => 'Click Add.';
}
