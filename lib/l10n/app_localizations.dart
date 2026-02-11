import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('fr'),
    Locale('it')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Exodus'**
  String get appTitle;

  /// No description provided for @entered.
  ///
  /// In en, this message translates to:
  /// **'Entered'**
  String get entered;

  /// No description provided for @stillInside.
  ///
  /// In en, this message translates to:
  /// **'Still Inside'**
  String get stillInside;

  /// No description provided for @capacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get capacity;

  /// No description provided for @resetSession.
  ///
  /// In en, this message translates to:
  /// **'Reset Session'**
  String get resetSession;

  /// No description provided for @exportLogs.
  ///
  /// In en, this message translates to:
  /// **'Export Logs'**
  String get exportLogs;

  /// No description provided for @helpAndInfo.
  ///
  /// In en, this message translates to:
  /// **'Help & Info'**
  String get helpAndInfo;

  /// No description provided for @setLocation.
  ///
  /// In en, this message translates to:
  /// **'Set Location'**
  String get setLocation;

  /// No description provided for @shutdown.
  ///
  /// In en, this message translates to:
  /// **'Shutdown'**
  String get shutdown;

  /// No description provided for @closeSession.
  ///
  /// In en, this message translates to:
  /// **'Close Session'**
  String get closeSession;

  /// No description provided for @logNow.
  ///
  /// In en, this message translates to:
  /// **'Log NOW'**
  String get logNow;

  /// No description provided for @viewLog.
  ///
  /// In en, this message translates to:
  /// **'View Log'**
  String get viewLog;

  /// No description provided for @exportAsCSV.
  ///
  /// In en, this message translates to:
  /// **'Export as CSV'**
  String get exportAsCSV;

  /// No description provided for @exportAsPDF.
  ///
  /// In en, this message translates to:
  /// **'Export as PDF'**
  String get exportAsPDF;

  /// No description provided for @previewReport.
  ///
  /// In en, this message translates to:
  /// **'Preview Report'**
  String get previewReport;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'CLR'**
  String get clear;

  /// No description provided for @nothingToUndo.
  ///
  /// In en, this message translates to:
  /// **'Nothing to undo'**
  String get nothingToUndo;

  /// No description provided for @loggedCurrentTotals.
  ///
  /// In en, this message translates to:
  /// **'Logged current totals'**
  String get loggedCurrentTotals;

  /// No description provided for @sessionClosed.
  ///
  /// In en, this message translates to:
  /// **'Session closed'**
  String get sessionClosed;

  /// No description provided for @resetEverything.
  ///
  /// In en, this message translates to:
  /// **'Reset Everything'**
  String get resetEverything;

  /// No description provided for @sessionResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Session reset successfully'**
  String get sessionResetSuccess;

  /// No description provided for @resetSessionQuestion.
  ///
  /// In en, this message translates to:
  /// **'Reset Session?'**
  String get resetSessionQuestion;

  /// No description provided for @resetSessionContent.
  ///
  /// In en, this message translates to:
  /// **'Would you like to export the current log before resetting?'**
  String get resetSessionContent;

  /// No description provided for @justReset.
  ///
  /// In en, this message translates to:
  /// **'Just Reset'**
  String get justReset;

  /// No description provided for @exportFirst.
  ///
  /// In en, this message translates to:
  /// **'Export First'**
  String get exportFirst;

  /// No description provided for @confirmFullReset.
  ///
  /// In en, this message translates to:
  /// **'Confirm Full Reset'**
  String get confirmFullReset;

  /// No description provided for @confirmResetContent.
  ///
  /// In en, this message translates to:
  /// **'This will delete ALL logs and reset counters to zero. This cannot be undone.'**
  String get confirmResetContent;

  /// No description provided for @setLocationName.
  ///
  /// In en, this message translates to:
  /// **'Set Location Name'**
  String get setLocationName;

  /// No description provided for @locationNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Main Entrance'**
  String get locationNameHint;

  /// No description provided for @validationExceedEntered.
  ///
  /// In en, this message translates to:
  /// **'Cannot exceed \'Entered\''**
  String get validationExceedEntered;

  /// No description provided for @validationLessInside.
  ///
  /// In en, this message translates to:
  /// **'Cannot be less than \'Still Inside\''**
  String get validationLessInside;

  /// No description provided for @deleteEntryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete entry?'**
  String get deleteEntryQuestion;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteAllEntriesQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete all entries?'**
  String get deleteAllEntriesQuestion;

  /// No description provided for @thisCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone.'**
  String get thisCannotBeUndone;

  /// No description provided for @deleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get deleteAll;

  /// No description provided for @noMatches.
  ///
  /// In en, this message translates to:
  /// **'No matches'**
  String get noMatches;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search logs...'**
  String get search;

  /// No description provided for @swipeToCount.
  ///
  /// In en, this message translates to:
  /// **'Swipe Up/Down to Count'**
  String get swipeToCount;

  /// No description provided for @userGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'EXODUS VENUE DASHBOARD: USER GUIDE'**
  String get userGuideTitle;

  /// No description provided for @guideOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'1. OVERVIEW'**
  String get guideOverviewTitle;

  /// No description provided for @guideOverviewContent.
  ///
  /// In en, this message translates to:
  /// **'Exodus is a professional attendance monitoring tool. Its purpose is to track the flow of visitors through a specific entrance or exit. Unlike a standard \'clicker,\' it manages two values simultaneously to provide a real-time view of venue safety and capacity.'**
  String get guideOverviewContent;

  /// No description provided for @guideOverviewEntered.
  ///
  /// In en, this message translates to:
  /// **'Entered: The cumulative total of all people who have passed through the gate. This number only goes up and represents the \'Total Flow.\''**
  String get guideOverviewEntered;

  /// No description provided for @guideOverviewInside.
  ///
  /// In en, this message translates to:
  /// **'Still Inside: The current headcount remaining within the venue. This number goes up when people enter and down when they leave.'**
  String get guideOverviewInside;

  /// No description provided for @guideDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'2. THE MAIN DASHBOARD (HOME SCREEN)'**
  String get guideDashboardTitle;

  /// No description provided for @guideDashboardContent.
  ///
  /// In en, this message translates to:
  /// **'This is the primary screen where the supervisor will spend 99% of their time.'**
  String get guideDashboardContent;

  /// No description provided for @guideDashboardHeader.
  ///
  /// In en, this message translates to:
  /// **'Branded Header: Features the Exodus logo. Long-pressing this logo provides a quick shortcut to the Help screen.'**
  String get guideDashboardHeader;

  /// No description provided for @guideDashboardLocation.
  ///
  /// In en, this message translates to:
  /// **'Location Row: Displays the name of the current gate (e.g., \'North Entrance\'). This ensures that if multiple phones are in use, the logs are correctly attributed.'**
  String get guideDashboardLocation;

  /// No description provided for @guideDashboardCapacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity Row: Displays the \'Max Capacity\' or safety limit for the area.'**
  String get guideDashboardCapacity;

  /// No description provided for @guideDashboardEnteredCard.
  ///
  /// In en, this message translates to:
  /// **'Entered Card (Blue): Large display of the total entries.'**
  String get guideDashboardEnteredCard;

  /// No description provided for @guideDashboardInsideCard.
  ///
  /// In en, this message translates to:
  /// **'Still Inside Card (Green/White): Large display of the current headcount.'**
  String get guideDashboardInsideCard;

  /// No description provided for @guideSafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'Visual Safety Indicators'**
  String get guideSafetyTitle;

  /// No description provided for @guideSafetyContent.
  ///
  /// In en, this message translates to:
  /// **'The Still Inside card uses a \'heat-map\' logic to warn the supervisor of potential overcrowding without them having to read the numbers:'**
  String get guideSafetyContent;

  /// No description provided for @guideSafetyTransition.
  ///
  /// In en, this message translates to:
  /// **'As the headcount approaches the Max Capacity, the card will smoothly transition from a neutral white to a graduated red.'**
  String get guideSafetyTransition;

  /// No description provided for @guideSafetyThreshold.
  ///
  /// In en, this message translates to:
  /// **'This warning begins when the remaining space is either 10 people or 2% of the total capacity (whichever is greater).'**
  String get guideSafetyThreshold;

  /// No description provided for @guideSafetySignal.
  ///
  /// In en, this message translates to:
  /// **'A deep red card is a signal to the supervisor to slow down or stop entries.'**
  String get guideSafetySignal;

  /// No description provided for @guideInputTitle.
  ///
  /// In en, this message translates to:
  /// **'3. INPUT MODES (HOW TO COUNT)'**
  String get guideInputTitle;

  /// No description provided for @guideInputContent.
  ///
  /// In en, this message translates to:
  /// **'At the top of the dashboard, there are two icons to switch the input method based on the situation.'**
  String get guideInputContent;

  /// No description provided for @guideInputButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'A. Button Mode (Icon: Tapping Finger)'**
  String get guideInputButtonTitle;

  /// No description provided for @guideInputButtonTapEntered.
  ///
  /// In en, this message translates to:
  /// **'Tap [+] on the blue card for an entry.'**
  String get guideInputButtonTapEntered;

  /// No description provided for @guideInputButtonTapInside.
  ///
  /// In en, this message translates to:
  /// **'Tap [-] on the green card for an exit.'**
  String get guideInputButtonTapInside;

  /// No description provided for @guideInputButtonBestFor.
  ///
  /// In en, this message translates to:
  /// **'Best for: Steady, manageable traffic where high precision is required.'**
  String get guideInputButtonBestFor;

  /// No description provided for @guideInputSwipeTitle.
  ///
  /// In en, this message translates to:
  /// **'B. Swipe Mode (Icon: Swiping Hand)'**
  String get guideInputSwipeTitle;

  /// No description provided for @guideInputSwipeUp.
  ///
  /// In en, this message translates to:
  /// **'Swipe UP anywhere on the screen to record an entry.'**
  String get guideInputSwipeUp;

  /// No description provided for @guideInputSwipeDown.
  ///
  /// In en, this message translates to:
  /// **'Swipe DOWN anywhere on the screen to record an exit.'**
  String get guideInputSwipeDown;

  /// No description provided for @guideInputSwipeBestFor.
  ///
  /// In en, this message translates to:
  /// **'Best for: Fast-moving crowds or \'rushes\' where the supervisor needs to keep their eyes on the visitors rather than the screen.'**
  String get guideInputSwipeBestFor;

  /// No description provided for @guideCorrectionTitle.
  ///
  /// In en, this message translates to:
  /// **'4. CORRECTION AND NAVIGATION'**
  String get guideCorrectionTitle;

  /// No description provided for @guideCorrectionContent.
  ///
  /// In en, this message translates to:
  /// **'Mistakes happen, especially during busy shifts. Exodus provides two layers of correction:'**
  String get guideCorrectionContent;

  /// No description provided for @guideCorrectionUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo (Top-Left Icon): Tapping the curved arrow instantly reverts the very last action taken (count or edit).'**
  String get guideCorrectionUndo;

  /// No description provided for @guideCorrectionManual.
  ///
  /// In en, this message translates to:
  /// **'Manual Edit (Keypad): Long-pressing either the Entered or Still Inside card opens a numeric keypad. This allows the supervisor to type in a confirmed headcount (e.g., after a manual floor check).'**
  String get guideCorrectionManual;

  /// No description provided for @guideLogTitle.
  ///
  /// In en, this message translates to:
  /// **'5. LOG HISTORY AND REPORTING'**
  String get guideLogTitle;

  /// No description provided for @guideLogContent.
  ///
  /// In en, this message translates to:
  /// **'Every action is recorded with a timestamp. To access the log, tap the Gear Icon and select View Log, or use the Long-press shortcut on the Gear icon.'**
  String get guideLogContent;

  /// No description provided for @guideLogSearch.
  ///
  /// In en, this message translates to:
  /// **'Search: Use the bar at the top to filter for specific events like \'RESET\' or \'MANUAL EDIT.\''**
  String get guideLogSearch;

  /// No description provided for @guideLogDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete: Individual entries can be removed by long-pressing them (requires confirmation).'**
  String get guideLogDelete;

  /// No description provided for @guideLogExport.
  ///
  /// In en, this message translates to:
  /// **'Exporting: You can share the logs as a CSV (for Excel) or a Formatted PDF.'**
  String get guideLogExport;

  /// No description provided for @guideLogPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview: The \'Preview Report\' option allows you to see the professional PDF layout before you send it via WhatsApp or Email.'**
  String get guideLogPreview;

  /// No description provided for @guideSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'6. SESSION MANAGEMENT'**
  String get guideSessionTitle;

  /// No description provided for @guideSessionResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Resetting the Day'**
  String get guideSessionResetTitle;

  /// No description provided for @guideSessionResetContent.
  ///
  /// In en, this message translates to:
  /// **'To clear the counters for a new shift or event, select Reset Session from the Gear menu.'**
  String get guideSessionResetContent;

  /// No description provided for @guideSessionResetExport.
  ///
  /// In en, this message translates to:
  /// **'The app will first ask if you want to Export the data so you don\'t lose the previous session\'s records.'**
  String get guideSessionResetExport;

  /// No description provided for @guideSessionResetConfirm.
  ///
  /// In en, this message translates to:
  /// **'A final confirmation is required before the app wipes the counters to 0 and clears the log history.'**
  String get guideSessionResetConfirm;

  /// No description provided for @guideSessionShutdownTitle.
  ///
  /// In en, this message translates to:
  /// **'Shutdown'**
  String get guideSessionShutdownTitle;

  /// No description provided for @guideSessionShutdownContent.
  ///
  /// In en, this message translates to:
  /// **'Selecting Shutdown creates a final log entry to close the digital paper trail and exits the app cleanly.'**
  String get guideSessionShutdownContent;

  /// No description provided for @installGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'EXODUS VENUE: INSTALLATION GUIDE'**
  String get installGuideTitle;

  /// No description provided for @installMobileTitle.
  ///
  /// In en, this message translates to:
  /// **'Installation on mobile phones'**
  String get installMobileTitle;

  /// No description provided for @installEdgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Edge Mobile'**
  String get installEdgeTitle;

  /// No description provided for @installEdgeStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Edge: https://RobiTobiGoGetGo.github.io/exodus_venue/'**
  String get installEdgeStep1;

  /// No description provided for @installEdgeStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the three horizontal lines or three dots in the bottom right corner.'**
  String get installEdgeStep2;

  /// No description provided for @installEdgeStep3.
  ///
  /// In en, this message translates to:
  /// **'Swipe up (or sideways) on the menu that appears to see more options.'**
  String get installEdgeStep3;

  /// No description provided for @installEdgeStep4.
  ///
  /// In en, this message translates to:
  /// **'Look for and tap Add to phone (it might also say Install app or Add to Home screen).'**
  String get installEdgeStep4;

  /// No description provided for @installEdgeStep5.
  ///
  /// In en, this message translates to:
  /// **'Follow the prompts to confirm the name \"Exodus Venue\" and tap Add.'**
  String get installEdgeStep5;

  /// No description provided for @installFirefoxTitle.
  ///
  /// In en, this message translates to:
  /// **'Firefox Mobile'**
  String get installFirefoxTitle;

  /// No description provided for @installAndroid.
  ///
  /// In en, this message translates to:
  /// **'Android:'**
  String get installAndroid;

  /// No description provided for @installFirefoxStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Firefox: https://RobiTobiGoGetGo.github.io/exodus_venue/'**
  String get installFirefoxStep1;

  /// No description provided for @installFirefoxStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the three dots (menu) next to the address bar (usually at the bottom or top).'**
  String get installFirefoxStep2;

  /// No description provided for @installFirefoxStep3.
  ///
  /// In en, this message translates to:
  /// **'Tap Install.'**
  String get installFirefoxStep3;

  /// No description provided for @installFirefoxStep4.
  ///
  /// In en, this message translates to:
  /// **'Confirm by tapping Add or Install again.'**
  String get installFirefoxStep4;

  /// No description provided for @installIos.
  ///
  /// In en, this message translates to:
  /// **'iPhone/iOS:'**
  String get installIos;

  /// No description provided for @installFirefoxIosContent.
  ///
  /// In en, this message translates to:
  /// **'Firefox on iOS does not have a direct \"Install\" button due to Apple\'s restrictions. You have to use the system menu:'**
  String get installFirefoxIosContent;

  /// No description provided for @installFirefoxIosStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Firefox.'**
  String get installFirefoxIosStep1;

  /// No description provided for @installFirefoxIosStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the Share icon (the square with an arrow pointing up) in the address bar.'**
  String get installFirefoxIosStep2;

  /// No description provided for @installFirefoxIosStep3.
  ///
  /// In en, this message translates to:
  /// **'Scroll down the list of options and tap Add to Home Screen.'**
  String get installFirefoxIosStep3;

  /// No description provided for @installFirefoxIosStep4.
  ///
  /// In en, this message translates to:
  /// **'Tap Add in the top right corner.'**
  String get installFirefoxIosStep4;

  /// No description provided for @installChromeTitle.
  ///
  /// In en, this message translates to:
  /// **'Chrome Mobile'**
  String get installChromeTitle;

  /// No description provided for @installChromeAndroidStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Chrome: https://RobiTobiGoGetGo.github.io/exodus_venue/'**
  String get installChromeAndroidStep1;

  /// No description provided for @installChromeAndroidStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the three dots in the top-right corner.'**
  String get installChromeAndroidStep2;

  /// No description provided for @installChromeAndroidStep3.
  ///
  /// In en, this message translates to:
  /// **'Tap Add to Home screen (on some versions, it may say Install app).'**
  String get installChromeAndroidStep3;

  /// No description provided for @installChromeAndroidStep4.
  ///
  /// In en, this message translates to:
  /// **'Tap Add or Install to confirm.'**
  String get installChromeAndroidStep4;

  /// No description provided for @installChromeIosStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Chrome.'**
  String get installChromeIosStep1;

  /// No description provided for @installChromeIosStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the Share icon (the square with an arrow pointing up) next to the address bar.'**
  String get installChromeIosStep2;

  /// No description provided for @installChromeIosStep3.
  ///
  /// In en, this message translates to:
  /// **'Scroll down and tap Add to Home Screen.'**
  String get installChromeIosStep3;

  /// No description provided for @installChromeIosStep4.
  ///
  /// In en, this message translates to:
  /// **'Tap Add in the top right.'**
  String get installChromeIosStep4;

  /// No description provided for @installDesktopTitle.
  ///
  /// In en, this message translates to:
  /// **'Desktop (Windows/Mac)'**
  String get installDesktopTitle;

  /// No description provided for @installDesktopStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Chrome.'**
  String get installDesktopStep1;

  /// No description provided for @installDesktopStep2.
  ///
  /// In en, this message translates to:
  /// **'Click the three dots in the top-right corner.'**
  String get installDesktopStep2;

  /// No description provided for @installDesktopStep3.
  ///
  /// In en, this message translates to:
  /// **'Select Save and Share.'**
  String get installDesktopStep3;

  /// No description provided for @installDesktopStep4.
  ///
  /// In en, this message translates to:
  /// **'Click Install page as app...'**
  String get installDesktopStep4;

  /// No description provided for @installDesktopStep5.
  ///
  /// In en, this message translates to:
  /// **'Click Install'**
  String get installDesktopStep5;

  /// No description provided for @installSafariIosTitle.
  ///
  /// In en, this message translates to:
  /// **'For Safari on iPhone & iPad (iOS)'**
  String get installSafariIosTitle;

  /// No description provided for @installSafariIosStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/'**
  String get installSafariIosStep1;

  /// No description provided for @installSafariIosStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the Share button at the bottom (the square with an arrow pointing up).'**
  String get installSafariIosStep2;

  /// No description provided for @installSafariIosStep3.
  ///
  /// In en, this message translates to:
  /// **'Scroll down the menu and tap Add to Home Screen.'**
  String get installSafariIosStep3;

  /// No description provided for @installSafariIosStep4.
  ///
  /// In en, this message translates to:
  /// **'Tap Add in the top-right corner.'**
  String get installSafariIosStep4;

  /// No description provided for @installSafariMacTitle.
  ///
  /// In en, this message translates to:
  /// **'For Safari on Mac (macOS)'**
  String get installSafariMacTitle;

  /// No description provided for @installSafariMacNote.
  ///
  /// In en, this message translates to:
  /// **'Note: This requires macOS Sonoma or later.'**
  String get installSafariMacNote;

  /// No description provided for @installSafariMacStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Safari.'**
  String get installSafariMacStep1;

  /// No description provided for @installSafariMacStep2.
  ///
  /// In en, this message translates to:
  /// **'Go to the File menu in the top menu bar.'**
  String get installSafariMacStep2;

  /// No description provided for @installSafariMacStep3.
  ///
  /// In en, this message translates to:
  /// **'Select Add to Dock...'**
  String get installSafariMacStep3;

  /// No description provided for @installSafariMacStep4.
  ///
  /// In en, this message translates to:
  /// **'Click Add.'**
  String get installSafariMacStep4;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
