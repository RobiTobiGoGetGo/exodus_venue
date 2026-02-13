// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get nothingToUndo => 'Nothing to undo!';

  @override
  String get noMatches => 'No matches found.';

  @override
  String get logNow => 'Log Now';

  @override
  String get loggedCurrentTotals => 'Logged current totals.';

  @override
  String get viewLog => 'View Log';

  @override
  String get exportLogs => 'Export Logs';

  @override
  String get helpAndInfo => 'Help & Info';

  @override
  String get resetSession => 'Reset Session';

  @override
  String get setLocation => 'Set Location';

  @override
  String get shutdown => 'Shutdown';

  @override
  String get closeSession => 'Close Session';

  @override
  String get sessionClosed => 'Session closed and logged.';

  @override
  String get exportAsCSV => 'Export as CSV';

  @override
  String get exportAsPDF => 'Export as PDF';

  @override
  String get previewReport => 'Preview Report';

  @override
  String get resetSessionQuestion => 'Reset Session?';

  @override
  String get resetSessionContent =>
      'Do you want to reset the counters and the log, or export first?';

  @override
  String get justReset => 'Just Reset';

  @override
  String get exportFirst => 'Export First';

  @override
  String get confirmFullReset => 'Confirm Full Reset';

  @override
  String get confirmResetContent =>
      'This will permanently delete the current session log and reset counters to zero. This cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get sessionResetSuccess => 'Session reset successful.';

  @override
  String get resetEverything => 'RESET EVERYTHING';

  @override
  String get setLocationName => 'Set Location Name';

  @override
  String get locationNameHint => 'e.g. Main Entrance';

  @override
  String get save => 'Save';

  @override
  String get clear => 'CLEAR';

  @override
  String get ok => 'OK';

  @override
  String get stillInside => 'Still Inside';

  @override
  String get entered => 'Entered';

  @override
  String get validationExceedEntered => 'Inside cannot exceed Entered!';

  @override
  String get validationLessInside => 'Entered cannot be less than Inside!';

  @override
  String get capacity => 'Capacity';

  @override
  String get swipeToCount => 'Swipe up/down to count';

  @override
  String get search => 'Search';

  @override
  String get deleteEntryQuestion => 'Delete this entry?';

  @override
  String get delete => 'Delete';

  @override
  String get deleteAllEntriesQuestion => 'Delete ALL entries?';

  @override
  String get thisCannotBeUndone => 'This cannot be undone.';

  @override
  String get deleteAll => 'DELETE ALL';

  @override
  String get userGuideTitle => 'Exodus User Guide';

  @override
  String get guideOverviewTitle => '1. Overview';

  @override
  String get guideOverviewContent =>
      'Exodus is a professional tool for venue entry management. It tracks two main numbers:';

  @override
  String get guideOverviewEntered =>
      'Total Entered: Cumulative count of everyone who entered.';

  @override
  String get guideOverviewInside =>
      'Still Inside: Current number of people remaining in the venue.';

  @override
  String get guideDashboardTitle => '2. The Dashboard';

  @override
  String get guideDashboardContent =>
      'The main screen provides real-time information:';

  @override
  String get guideDashboardHeader =>
      'Header: Shows the venue logo. Long-press to open this guide.';

  @override
  String get guideDashboardLocation =>
      'Location: Displayed below the logo. Long-press to rename.';

  @override
  String get guideDashboardCapacity =>
      'Capacity: Displayed next to location. Long-press to edit.';

  @override
  String get guideDashboardEnteredCard =>
      'Entered Card (Blue): Shows total entries.';

  @override
  String get guideDashboardInsideCard =>
      'Inside Card (Green): Shows current occupancy.';

  @override
  String get guideSafetyTitle => '3. Capacity & Safety';

  @override
  String get guideSafetyContent => 'The app monitors safety limits:';

  @override
  String get guideSafetyTransition =>
      'The Inside card turns red as you approach capacity.';

  @override
  String get guideSafetyThreshold =>
      'Warning starts at 2% or 10 people before the limit.';

  @override
  String get guideSafetySignal =>
      'A fully red card indicates the venue is at or over capacity.';

  @override
  String get guideInputTitle => '4. Input Methods';

  @override
  String get guideInputContent =>
      'Switch between two modes using the top icons:';

  @override
  String get guideInputButtonTitle => 'Button Mode (Default)';

  @override
  String get guideInputButtonTapEntered =>
      'Tap [+] to increment both counters (person enters).';

  @override
  String get guideInputButtonTapInside =>
      'Tap [-] to decrement \'Still Inside\' (person exits).';

  @override
  String get guideInputButtonBestFor =>
      'Best for: High-precision counting at fixed gates.';

  @override
  String get guideInputSwipeTitle => 'Swipe Mode (Gesture)';

  @override
  String get guideInputSwipeUp =>
      'Swipe up anywhere to increment both counters.';

  @override
  String get guideInputSwipeDown =>
      'Swipe down anywhere to decrement \'Still Inside\'.';

  @override
  String get guideInputSwipeBestFor =>
      'Best for: Fast-paced entry monitoring where eyes must stay on the crowd.';

  @override
  String get guideCorrectionTitle => '5. Corrections';

  @override
  String get guideCorrectionContent => 'Mistakes can be corrected in two ways:';

  @override
  String get guideCorrectionUndo =>
      'Undo: Tap the circular arrow icon in the top left to revert the last action.';

  @override
  String get guideCorrectionManual =>
      'Manual Edit: Long-press any number on the dashboard to type a specific value using the secure keypad.';

  @override
  String get guideLogTitle => '6. Log & Reporting';

  @override
  String get guideLogContent => 'Every action is time-stamped and recorded:';

  @override
  String get guideLogSearch =>
      'Search: Use the magnifying glass to find specific events (e.g., \'MANUAL\').';

  @override
  String get guideLogDelete => 'Delete: Long-press a log entry to remove it.';

  @override
  String get guideLogExport =>
      'Export: Use the share icon to generate PDF reports or CSV spreadsheets.';

  @override
  String get guideLogPreview =>
      'Preview: View the report layout before sharing.';

  @override
  String get guideSessionTitle => '7. Session Management';

  @override
  String get guideSessionResetTitle => 'Reset Session';

  @override
  String get guideSessionResetContent => 'Clears all data for a new day.';

  @override
  String get guideSessionResetExport =>
      'The app will ask if you want to export your data first.';

  @override
  String get guideSessionResetConfirm =>
      'Requires double confirmation to prevent accidental loss.';

  @override
  String get guideSessionShutdownTitle => 'Shutdown';

  @override
  String get guideSessionShutdownContent =>
      'Properly logs the end of work and exits the application.';

  @override
  String get installGuideTitle => 'Exodus Venue: Installation Guide';

  @override
  String get installMobileTitle => 'Mobile Phone Installation';

  @override
  String get installEdgeTitle => 'Edge Mobile';

  @override
  String get installEdgeStep1 =>
      'Open the website in Edge: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installEdgeStep2 =>
      'Tap the three horizontal lines or three dots in the bottom right.';

  @override
  String get installEdgeStep3 =>
      'Swipe up (or sideways) in the menu that appears to see more options.';

  @override
  String get installEdgeStep4 =>
      'Look for and tap \'Add to phone\' (it might also say \'Install app\' or \'Add to Home screen\').';

  @override
  String get installEdgeStep5 =>
      'Follow the prompts to confirm the name \'Exodus Venue\' and tap \'Add\'.';

  @override
  String get installFirefoxTitle => 'Firefox Mobile';

  @override
  String get installAndroid => 'Android:';

  @override
  String get installFirefoxStep1 =>
      'Open the website in Firefox: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installFirefoxStep2 =>
      'Tap the three dots (menu) next to the address bar (usually bottom or top).';

  @override
  String get installFirefoxStep3 => 'Tap \'Install\'.';

  @override
  String get installFirefoxStep4 =>
      'Confirm by tapping \'Add\' or \'Install\' again.';

  @override
  String get installIos => 'iPhone/iOS:';

  @override
  String get installFirefoxIosContent =>
      'Firefox on iOS does not have a direct \'Install\' button due to Apple restrictions. You must use the system menu:';

  @override
  String get installFirefoxIosStep1 => 'Open the website in Firefox.';

  @override
  String get installFirefoxIosStep2 =>
      'Tap the Share icon (square with an up arrow) in the address bar.';

  @override
  String get installFirefoxIosStep3 =>
      'Scroll through the list of options and tap \'Add to Home Screen\'.';

  @override
  String get installFirefoxIosStep4 => 'Tap \'Add\' in the top right corner.';

  @override
  String get installChromeTitle => 'Chrome Mobile';

  @override
  String get installChromeAndroidStep1 =>
      'Open the website in Chrome: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installChromeAndroidStep2 =>
      'Tap the three dots in the top right corner.';

  @override
  String get installChromeAndroidStep3 =>
      'Tap \'Add to Home screen\' (in some versions, it might say \'Install app\').';

  @override
  String get installChromeAndroidStep4 =>
      'Tap \'Add\' or \'Install\' to confirm.';

  @override
  String get installChromeIosStep1 => 'Open the website in Chrome.';

  @override
  String get installChromeIosStep2 =>
      'Tap the Share icon (square with an up arrow) next to the address bar.';

  @override
  String get installChromeIosStep3 =>
      'Scroll down and tap \'Add to Home Screen\'.';

  @override
  String get installChromeIosStep4 => 'Tap \'Add\' in the top right corner.';

  @override
  String get installDesktopTitle => 'Desktop (Windows/Mac)';

  @override
  String get installDesktopStep1 => 'Open the website in Chrome.';

  @override
  String get installDesktopStep2 => 'Click the three dots in the top right.';

  @override
  String get installDesktopStep3 => 'Select \'Save and Share\'.';

  @override
  String get installDesktopStep4 => 'Click \'Install page as app...\'';

  @override
  String get installDesktopStep5 => 'Click \'Install\'.';

  @override
  String get installSafariIosTitle => 'For Safari on iPhone and iPad (iOS)';

  @override
  String get installSafariIosStep1 =>
      'Open the website in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installSafariIosStep2 =>
      'Tap the Share button at the bottom (the square with an up arrow).';

  @override
  String get installSafariIosStep3 =>
      'Scroll through the menu and tap \'Add to Home Screen\'.';

  @override
  String get installSafariIosStep4 => 'Tap \'Add\' in the top right corner.';

  @override
  String get installSafariMacTitle => 'For Safari on Mac (macOS)';

  @override
  String get installSafariMacNote =>
      'Note: This requires macOS Sonoma or later.';

  @override
  String get installSafariMacStep1 => 'Open the website in Safari.';

  @override
  String get installSafariMacStep2 =>
      'Go to the \'File\' menu in the top menu bar.';

  @override
  String get installSafariMacStep3 => 'Select \'Add to Dock...\'';

  @override
  String get installSafariMacStep4 => 'Click \'Add\'.';
}
