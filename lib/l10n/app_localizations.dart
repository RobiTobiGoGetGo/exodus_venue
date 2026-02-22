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

  /// No description provided for @nothingToUndo.
  ///
  /// In en, this message translates to:
  /// **'Nothing to undo!'**
  String get nothingToUndo;

  /// No description provided for @noMatches.
  ///
  /// In en, this message translates to:
  /// **'No matches found.'**
  String get noMatches;

  /// No description provided for @logNow.
  ///
  /// In en, this message translates to:
  /// **'Log Now'**
  String get logNow;

  /// No description provided for @loggedCurrentTotals.
  ///
  /// In en, this message translates to:
  /// **'Logged current totals.'**
  String get loggedCurrentTotals;

  /// No description provided for @viewLog.
  ///
  /// In en, this message translates to:
  /// **'View Log'**
  String get viewLog;

  /// No description provided for @viewErrorLog.
  ///
  /// In en, this message translates to:
  /// **'View Error Log'**
  String get viewErrorLog;

  /// No description provided for @exportLogs.
  ///
  /// In en, this message translates to:
  /// **'Export Logs'**
  String get exportLogs;

  /// No description provided for @exportErrors.
  ///
  /// In en, this message translates to:
  /// **'Export Error Log'**
  String get exportErrors;

  /// No description provided for @previewErrorLog.
  ///
  /// In en, this message translates to:
  /// **'Preview Error Log'**
  String get previewErrorLog;

  /// No description provided for @helpAndInfo.
  ///
  /// In en, this message translates to:
  /// **'Help & Info'**
  String get helpAndInfo;

  /// No description provided for @resetSession.
  ///
  /// In en, this message translates to:
  /// **'Reset Session'**
  String get resetSession;

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

  /// No description provided for @sessionClosed.
  ///
  /// In en, this message translates to:
  /// **'Session closed and logged.'**
  String get sessionClosed;

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

  /// No description provided for @resetSessionQuestion.
  ///
  /// In en, this message translates to:
  /// **'Reset Session?'**
  String get resetSessionQuestion;

  /// No description provided for @resetSessionContent.
  ///
  /// In en, this message translates to:
  /// **'Do you want to reset the counters and the log, or export first?'**
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
  /// **'This will permanently delete the current session log and reset counters to zero. This cannot be undone.'**
  String get confirmResetContent;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @sessionResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Session reset successful.'**
  String get sessionResetSuccess;

  /// No description provided for @resetEverything.
  ///
  /// In en, this message translates to:
  /// **'RESET EVERYTHING'**
  String get resetEverything;

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

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'CLEAR'**
  String get clear;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @stillInside.
  ///
  /// In en, this message translates to:
  /// **'Still Inside'**
  String get stillInside;

  /// No description provided for @entered.
  ///
  /// In en, this message translates to:
  /// **'Entered'**
  String get entered;

  /// No description provided for @validationExceedEntered.
  ///
  /// In en, this message translates to:
  /// **'Inside cannot exceed Entered!'**
  String get validationExceedEntered;

  /// No description provided for @validationLessInside.
  ///
  /// In en, this message translates to:
  /// **'Entered cannot be less than Inside!'**
  String get validationLessInside;

  /// No description provided for @capacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get capacity;

  /// No description provided for @swipeToCount.
  ///
  /// In en, this message translates to:
  /// **'Swipe up/down to count'**
  String get swipeToCount;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @deleteEntryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete this entry?'**
  String get deleteEntryQuestion;

  /// No description provided for @deleteErrorQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete this error entry?'**
  String get deleteErrorQuestion;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteAllEntriesQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete ALL entries?'**
  String get deleteAllEntriesQuestion;

  /// No description provided for @deleteAllErrorsQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete ALL error entries?'**
  String get deleteAllErrorsQuestion;

  /// No description provided for @thisCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone.'**
  String get thisCannotBeUndone;

  /// No description provided for @deleteAll.
  ///
  /// In en, this message translates to:
  /// **'DELETE ALL'**
  String get deleteAll;

  /// No description provided for @userGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Exodus User Guide'**
  String get userGuideTitle;

  /// No description provided for @guideOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'1. Overview'**
  String get guideOverviewTitle;

  /// No description provided for @guideOverviewContent.
  ///
  /// In en, this message translates to:
  /// **'Exodus is a professional tool for venue entry management. It tracks two main numbers:'**
  String get guideOverviewContent;

  /// No description provided for @guideOverviewEntered.
  ///
  /// In en, this message translates to:
  /// **'Total Entered: Cumulative count of everyone who entered.'**
  String get guideOverviewEntered;

  /// No description provided for @guideOverviewInside.
  ///
  /// In en, this message translates to:
  /// **'Still Inside: Current number of people remaining in the venue.'**
  String get guideOverviewInside;

  /// No description provided for @guideDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'2. The Dashboard'**
  String get guideDashboardTitle;

  /// No description provided for @guideDashboardContent.
  ///
  /// In en, this message translates to:
  /// **'The main screen provides real-time information:'**
  String get guideDashboardContent;

  /// No description provided for @guideDashboardHeader.
  ///
  /// In en, this message translates to:
  /// **'Header: Shows the venue logo. Long-press to open this user guide.'**
  String get guideDashboardHeader;

  /// No description provided for @guideDashboardLocation.
  ///
  /// In en, this message translates to:
  /// **'Location: The point of entry to the venue is displayed below the logo. Long-press to rename.'**
  String get guideDashboardLocation;

  /// No description provided for @guideDashboardCapacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity: Displayed next to location. Long-press to edit.'**
  String get guideDashboardCapacity;

  /// No description provided for @guideDashboardEnteredCard.
  ///
  /// In en, this message translates to:
  /// **'Entered Card (Blue): Shows total entries.'**
  String get guideDashboardEnteredCard;

  /// No description provided for @guideDashboardInsideCard.
  ///
  /// In en, this message translates to:
  /// **'Inside Card (Green): Shows the current head count in the venue.'**
  String get guideDashboardInsideCard;

  /// No description provided for @guideSafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'3. Capacity & Safety'**
  String get guideSafetyTitle;

  /// No description provided for @guideSafetyContent.
  ///
  /// In en, this message translates to:
  /// **'The app monitors safety limits:'**
  String get guideSafetyContent;

  /// No description provided for @guideSafetyTransition.
  ///
  /// In en, this message translates to:
  /// **'The Inside card turns red as capacity is approached.'**
  String get guideSafetyTransition;

  /// No description provided for @guideSafetyThreshold.
  ///
  /// In en, this message translates to:
  /// **'Warning starts at 2% or 10 people before the limit.'**
  String get guideSafetyThreshold;

  /// No description provided for @guideSafetySignal.
  ///
  /// In en, this message translates to:
  /// **'A fully red card indicates the venue is at or over capacity.'**
  String get guideSafetySignal;

  /// No description provided for @guideInputTitle.
  ///
  /// In en, this message translates to:
  /// **'4. Input Methods'**
  String get guideInputTitle;

  /// No description provided for @guideInputContent.
  ///
  /// In en, this message translates to:
  /// **'Switch between button and swipe mode using the icons directly above the counter cards:'**
  String get guideInputContent;

  /// No description provided for @guideInputButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Button Mode (Default)'**
  String get guideInputButtonTitle;

  /// No description provided for @guideInputButtonTapEntered.
  ///
  /// In en, this message translates to:
  /// **'Tap [+] to increment both counters (person enters).'**
  String get guideInputButtonTapEntered;

  /// No description provided for @guideInputButtonTapInside.
  ///
  /// In en, this message translates to:
  /// **'Tap [-] to decrement \'Still Inside\' (person exits).'**
  String get guideInputButtonTapInside;

  /// No description provided for @guideInputButtonBestFor.
  ///
  /// In en, this message translates to:
  /// **'Best for: High-precision counting at fixed gates.'**
  String get guideInputButtonBestFor;

  /// No description provided for @guideInputSwipeTitle.
  ///
  /// In en, this message translates to:
  /// **'Swipe Mode (Gesture)'**
  String get guideInputSwipeTitle;

  /// No description provided for @guideInputSwipeUp.
  ///
  /// In en, this message translates to:
  /// **'Swipe up anywhere to increment both counters.'**
  String get guideInputSwipeUp;

  /// No description provided for @guideInputSwipeDown.
  ///
  /// In en, this message translates to:
  /// **'Swipe down anywhere to decrement \'Still Inside\'.'**
  String get guideInputSwipeDown;

  /// No description provided for @guideInputSwipeBestFor.
  ///
  /// In en, this message translates to:
  /// **'Best for: Fast-paced entry monitoring where eyes must stay on the crowd.'**
  String get guideInputSwipeBestFor;

  /// No description provided for @guideCorrectionTitle.
  ///
  /// In en, this message translates to:
  /// **'5. Corrections'**
  String get guideCorrectionTitle;

  /// No description provided for @guideCorrectionContent.
  ///
  /// In en, this message translates to:
  /// **'Mistakes can be corrected in two ways:'**
  String get guideCorrectionContent;

  /// No description provided for @guideCorrectionUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo: Tap the semi circular reverse arrow icon in the top left to revert the last action.'**
  String get guideCorrectionUndo;

  /// No description provided for @guideCorrectionManual.
  ///
  /// In en, this message translates to:
  /// **'Manual Edit: Long-press any number on the dashboard to type a specific value using the secure keypad.'**
  String get guideCorrectionManual;

  /// No description provided for @guideLogTitle.
  ///
  /// In en, this message translates to:
  /// **'6. Log & Reporting'**
  String get guideLogTitle;

  /// No description provided for @guideLogContent.
  ///
  /// In en, this message translates to:
  /// **'Every log action is time-stamped, as well as the reason for the change and the current counts:'**
  String get guideLogContent;

  /// No description provided for @guideLogSearch.
  ///
  /// In en, this message translates to:
  /// **'Search: Use the magnifying glass to find specific events (e.g., \'MANUAL\').'**
  String get guideLogSearch;

  /// No description provided for @guideLogDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete: Long-press a log entry to remove it.'**
  String get guideLogDelete;

  /// No description provided for @guideLogExport.
  ///
  /// In en, this message translates to:
  /// **'Export: Use the share icon to generate PDF reports or CSV spreadsheets.'**
  String get guideLogExport;

  /// No description provided for @guideLogPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview: View the report layout before sharing.'**
  String get guideLogPreview;

  /// No description provided for @guideSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'7. Session Management'**
  String get guideSessionTitle;

  /// No description provided for @guideSessionResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Session'**
  String get guideSessionResetTitle;

  /// No description provided for @guideSessionResetContent.
  ///
  /// In en, this message translates to:
  /// **'Clears all data to begin all over again.'**
  String get guideSessionResetContent;

  /// No description provided for @guideSessionResetExport.
  ///
  /// In en, this message translates to:
  /// **'The app will ask if the log should be exported before the data gets deleted.'**
  String get guideSessionResetExport;

  /// No description provided for @guideSessionResetConfirm.
  ///
  /// In en, this message translates to:
  /// **'Requires double confirmation to prevent accidental loss.'**
  String get guideSessionResetConfirm;

  /// No description provided for @guideSessionShutdownTitle.
  ///
  /// In en, this message translates to:
  /// **'Shutdown'**
  String get guideSessionShutdownTitle;

  /// No description provided for @guideSessionShutdownContent.
  ///
  /// In en, this message translates to:
  /// **'Properly logs the end of work and exits the application.'**
  String get guideSessionShutdownContent;

  /// No description provided for @installGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Exodus Venue: Installation Guide'**
  String get installGuideTitle;

  /// No description provided for @installMobileTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobile Phone Installation'**
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
  /// **'Tap the three horizontal lines or three dots in the bottom right.'**
  String get installEdgeStep2;

  /// No description provided for @installEdgeStep3.
  ///
  /// In en, this message translates to:
  /// **'Swipe up (or sideways) in the menu that appears to see more options.'**
  String get installEdgeStep3;

  /// No description provided for @installEdgeStep4.
  ///
  /// In en, this message translates to:
  /// **'Look for and tap \'Add to phone\' (it might also say \'Install app\' or \'Add to Home screen\').'**
  String get installEdgeStep4;

  /// No description provided for @installEdgeStep5.
  ///
  /// In en, this message translates to:
  /// **'Follow the prompts to confirm the name \'Exodus Venue\' and tap \'Add\'.'**
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
  /// **'Tap the three dots (menu) next to the address bar (usually bottom or top).'**
  String get installFirefoxStep2;

  /// No description provided for @installFirefoxStep3.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Install\'.'**
  String get installFirefoxStep3;

  /// No description provided for @installFirefoxStep4.
  ///
  /// In en, this message translates to:
  /// **'Confirm by tapping \'Add\' or \'Install\' again.'**
  String get installFirefoxStep4;

  /// No description provided for @installIos.
  ///
  /// In en, this message translates to:
  /// **'iPhone/iOS:'**
  String get installIos;

  /// No description provided for @installFirefoxIosContent.
  ///
  /// In en, this message translates to:
  /// **'Firefox on iOS does not have a direct \'Install\' button due to Apple restrictions. You must use the system menu:'**
  String get installFirefoxIosContent;

  /// No description provided for @installFirefoxIosStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Firefox.'**
  String get installFirefoxIosStep1;

  /// No description provided for @installFirefoxIosStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the Share icon (square with an up arrow) in the address bar.'**
  String get installFirefoxIosStep2;

  /// No description provided for @installFirefoxIosStep3.
  ///
  /// In en, this message translates to:
  /// **'Scroll through the list of options and tap \'Add to Home Screen\'.'**
  String get installFirefoxIosStep3;

  /// No description provided for @installFirefoxIosStep4.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Add\' in the top right corner.'**
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
  /// **'Tap the three dots in the top right corner.'**
  String get installChromeAndroidStep2;

  /// No description provided for @installChromeAndroidStep3.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Add to Home screen\' (in some versions, it might say \'Install app\').'**
  String get installChromeAndroidStep3;

  /// No description provided for @installChromeAndroidStep4.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Add\' or \'Install\' to confirm.'**
  String get installChromeAndroidStep4;

  /// No description provided for @installChromeIosStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Chrome.'**
  String get installChromeIosStep1;

  /// No description provided for @installChromeIosStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the Share icon (square with an up arrow) next to the address bar.'**
  String get installChromeIosStep2;

  /// No description provided for @installChromeIosStep3.
  ///
  /// In en, this message translates to:
  /// **'Scroll down and tap \'Add to Home Screen\'.'**
  String get installChromeIosStep3;

  /// No description provided for @installChromeIosStep4.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Add\' in the top right corner.'**
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
  /// **'Click the three dots in the top right.'**
  String get installDesktopStep2;

  /// No description provided for @installDesktopStep3.
  ///
  /// In en, this message translates to:
  /// **'Select \'Save and Share\'.'**
  String get installDesktopStep3;

  /// No description provided for @installDesktopStep4.
  ///
  /// In en, this message translates to:
  /// **'Click \'Install page as app...\''**
  String get installDesktopStep4;

  /// No description provided for @installDesktopStep5.
  ///
  /// In en, this message translates to:
  /// **'Click \'Install\'.'**
  String get installDesktopStep5;

  /// No description provided for @installSafariIosTitle.
  ///
  /// In en, this message translates to:
  /// **'For Safari on iPhone and iPad (iOS)'**
  String get installSafariIosTitle;

  /// No description provided for @installSafariIosStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the website in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/'**
  String get installSafariIosStep1;

  /// No description provided for @installSafariIosStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap the Share button at the bottom (the square with an up arrow).'**
  String get installSafariIosStep2;

  /// No description provided for @installSafariIosStep3.
  ///
  /// In en, this message translates to:
  /// **'Scroll through the menu and tap \'Add to Home Screen\'.'**
  String get installSafariIosStep3;

  /// No description provided for @installSafariIosStep4.
  ///
  /// In en, this message translates to:
  /// **'Tap \'Add\' in the top right corner.'**
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
  /// **'Go to the \'File\' menu in the top menu bar.'**
  String get installSafariMacStep2;

  /// No description provided for @installSafariMacStep3.
  ///
  /// In en, this message translates to:
  /// **'Select \'Add to Dock...\''**
  String get installSafariMacStep3;

  /// No description provided for @installSafariMacStep4.
  ///
  /// In en, this message translates to:
  /// **'Click \'Add\'.'**
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
