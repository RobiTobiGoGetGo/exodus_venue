// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get nothingToUndo => 'Rien à annuler !';

  @override
  String get noMatches => 'Aucun résultat trouvé.';

  @override
  String get logNow => 'Enregistrer maintenant';

  @override
  String get loggedCurrentTotals => 'Totaux actuels enregistrés.';

  @override
  String get viewLog => 'Voir le journal';

  @override
  String get viewErrorLog => 'Voir le journal des erreurs';

  @override
  String get exportLogs => 'Exporter les journaux';

  @override
  String get exportErrors => 'Exporter le journal des erreurs';

  @override
  String get previewErrorLog => 'Aperçu du journal des erreurs';

  @override
  String get helpAndInfo => 'Aide & Infos';

  @override
  String get resetSession => 'Réinitialiser la session';

  @override
  String get setLocation => 'Définir le lieu';

  @override
  String get shutdown => 'Éteindre';

  @override
  String get closeSession => 'Fermer la session';

  @override
  String get sessionClosed => 'Session fermée et enregistrée.';

  @override
  String get exportAsCSV => 'Exporter en CSV';

  @override
  String get exportAsPDF => 'Exporter en PDF';

  @override
  String get previewReport => 'Aperçu du rapport';

  @override
  String get resetSessionQuestion => 'Réinitialiser la session ?';

  @override
  String get resetSessionContent =>
      'Voulez-vous réinitialiser les compteurs et le journal, ou exporter d\'abord ?';

  @override
  String get justReset => 'Simplement réinitialiser';

  @override
  String get exportFirst => 'Exporter d\'abord';

  @override
  String get confirmFullReset => 'Confirmer la réinitialisation complète';

  @override
  String get confirmResetContent =>
      'Cela supprimera définitivement le journal de la session actuelle et remettra les compteurs à zéro. Cette opération est irréversible.';

  @override
  String get cancel => 'Annuler';

  @override
  String get sessionResetSuccess => 'Réinitialisation de la session réussie.';

  @override
  String get resetEverything => 'TOUT RÉINITIALISER';

  @override
  String get setLocationName => 'Définir le nom du lieu';

  @override
  String get locationNameHint => 'ex. Entrée principale';

  @override
  String get save => 'Enregistrer';

  @override
  String get clear => 'EFFACER';

  @override
  String get ok => 'OK';

  @override
  String get stillInside => 'Encore à l\'intérieur';

  @override
  String get entered => 'Entré';

  @override
  String get validationExceedEntered =>
      'Le nombre de personnes à l\'intérieur ne peut pas dépasser le total des entrées !';

  @override
  String get validationLessInside =>
      'Le total des entrées ne peut pas être inférieur au nombre de personnes à l\'intérieur !';

  @override
  String get capacity => 'Capacité';

  @override
  String get swipeToCount => 'Balayer vers le haut/bas pour compter';

  @override
  String get search => 'Rechercher';

  @override
  String get deleteEntryQuestion => 'Supprimer cette entrée ?';

  @override
  String get deleteErrorQuestion => 'Supprimer cette entrée d\'erreur ?';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteAllEntriesQuestion => 'Supprimer TOUTES les entrées ?';

  @override
  String get deleteAllErrorsQuestion =>
      'Supprimer TOUTES les entrées d\'erreur ?';

  @override
  String get thisCannotBeUndone => 'Cette opération est irréversible.';

  @override
  String get deleteAll => 'TOUT SUPPRIMER';

  @override
  String get userGuideTitle => 'Guide de l\'utilisateur Exodus';

  @override
  String get guideOverviewTitle => '1. Aperçu';

  @override
  String get guideOverviewContent =>
      'Exodus est un outil professionnel pour la gestion des entrées de lieux. Il suit deux chiffres principaux :';

  @override
  String get guideOverviewEntered =>
      'Total Entré : Nombre cumulé de toutes les personnes qui sont entrées.';

  @override
  String get guideOverviewInside =>
      'Encore à l\'intérieur : Nombre actuel de personnes restant dans le lieu.';

  @override
  String get guideDashboardTitle => '2. Le tableau de bord';

  @override
  String get guideDashboardContent =>
      'L\'écran principal fournit des informations en temps réel :';

  @override
  String get guideDashboardHeader =>
      'En-tête : Affiche le logo du lieu. Appuyez longuement pour ouvrir ce guide de l\'utilisateur.';

  @override
  String get guideDashboardLocation =>
      'Lieu : Le point d\'entrée au lieu est affiché sous le logo. Appuyez longuement pour renommer.';

  @override
  String get guideDashboardCapacity =>
      'Capacité : Affichée à côté du lieu. Appuyez longuement pour modifier.';

  @override
  String get guideDashboardEnteredCard =>
      'Carte Entré (Bleue) : Affiche le total des entrées.';

  @override
  String get guideDashboardInsideCard =>
      'Carte Encore à l\'intérieur (Verte) : Affiche le décompte actuel des personnes dans le lieu.';

  @override
  String get guideSafetyTitle => '3. Capacité et sécurité';

  @override
  String get guideSafetyContent =>
      'L\'application surveille les limites de sécurité :';

  @override
  String get guideSafetyTransition =>
      'La carte \'Encore à l\'intérieur\' devient rouge à mesure que la capacité est approchée.';

  @override
  String get guideSafetyThreshold =>
      'L\'avertissement commence à 2% ou 10 personnes avant la limite.';

  @override
  String get guideSafetySignal =>
      'Une carte entièrement rouge indique que le lieu a atteint ou dépassé sa capacité.';

  @override
  String get guideInputTitle => '4. Méthodes de saisie';

  @override
  String get guideInputContent =>
      'Basculez entre le mode bouton et le mode balayage à l\'aide des icônes situées directement au-dessus des cartes de compteur :';

  @override
  String get guideInputButtonTitle => 'Mode Bouton (Par défaut)';

  @override
  String get guideInputButtonTapEntered =>
      'Appuyez sur [+] pour incrémenter les deux compteurs (une personne entre).';

  @override
  String get guideInputButtonTapInside =>
      'Appuyez sur [-] pour décrémenter \'Encore à l\'intérieur\' (une personne sort).';

  @override
  String get guideInputButtonBestFor =>
      'Idéal pour : Un comptage de haute précision aux portes fixes.';

  @override
  String get guideInputSwipeTitle => 'Mode Balayage (Geste)';

  @override
  String get guideInputSwipeUp =>
      'Balayez vers le haut n\'importe où pour incrémenter les deux compteurs.';

  @override
  String get guideInputSwipeDown =>
      'Balayez vers le bas n\'importe où pour décrémenter \'Encore à l\'intérieur\'.';

  @override
  String get guideInputSwipeBestFor =>
      'Idéal pour : Une surveillance des entrées à rythme rapide où les yeux doivent rester sur la foule.';

  @override
  String get guideCorrectionTitle => '5. Corrections';

  @override
  String get guideCorrectionContent =>
      'Les erreurs peuvent être corrigées de deux manières :';

  @override
  String get guideCorrectionUndo =>
      'Annuler : Appuyez sur l\'icône de flèche de retour semi-circulaire en haut à gauche pour annuler la dernière action.';

  @override
  String get guideCorrectionManual =>
      'Modification manuelle : Appuyez longuement sur n\'importe quel chiffre du tableau de bord pour saisir une valeur spécifique à l\'aide du clavier sécurisé.';

  @override
  String get guideLogTitle => '6. Journal et rapports';

  @override
  String get guideLogContent =>
      'Chaque action de journal est horodatée, ainsi que la raison du changement et les comptes actuels :';

  @override
  String get guideLogSearch =>
      'Recherche : Utilisez la loupe pour trouver des événements spécifiques (ex. \'MANUAL\').';

  @override
  String get guideLogDelete =>
      'Supprimer : Appuyez longuement sur une entrée du journal pour la retirer.';

  @override
  String get guideLogExport =>
      'Exporter : Utilisez l\'icône de partage pour générer des rapports PDF ou des tableurs CSV.';

  @override
  String get guideLogPreview =>
      'Aperçu : Visualisez la mise en page du rapport avant de le partager.';

  @override
  String get guideSessionTitle => '7. Gestion de la session';

  @override
  String get guideSessionResetTitle => 'Réinitialiser la session';

  @override
  String get guideSessionResetContent =>
      'Efface toutes les données pour recommencer depuis le début.';

  @override
  String get guideSessionResetExport =>
      'L\'application vous demandera si le journal doit être exporté avant que les données ne soient supprimées.';

  @override
  String get guideSessionResetConfirm =>
      'Nécessite une double confirmation pour éviter toute perte accidentelle.';

  @override
  String get guideSessionShutdownTitle => 'Éteindre';

  @override
  String get guideSessionShutdownContent =>
      'Enregistre correctement la fin du travail et quitte l\'application.';

  @override
  String get installGuideTitle => 'Exodus Venue : Guide d\'installation';

  @override
  String get installMobileTitle => 'Installation sur téléphone portable';

  @override
  String get installEdgeTitle => 'Edge Mobile';

  @override
  String get installEdgeStep1 =>
      'Ouvrez le site Web dans Edge : https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installEdgeStep2 =>
      'Appuyez sur les trois lignes horizontales ou sur les trois points en bas à droite.';

  @override
  String get installEdgeStep3 =>
      'Balayez vers le haut (ou sur le côté) dans le menu qui apparaît pour voir plus d\'options.';

  @override
  String get installEdgeStep4 =>
      'Cherchez et appuyez sur Ajouter au téléphone (cela peut aussi être Installer l\'application ou Ajouter à l\'écran d\'accueil).';

  @override
  String get installEdgeStep5 =>
      'Suivez les instructions pour confirmer le nom \"Exodus Venue\" et appuyez sur Ajouter.';

  @override
  String get installFirefoxTitle => 'Firefox Mobile';

  @override
  String get installAndroid => 'Android :';

  @override
  String get installFirefoxStep1 =>
      'Ouvrez le site Web dans Firefox : https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installFirefoxStep2 =>
      'Appuyez sur les trois points (menu) à côté de la barre d\'adresse (généralement en bas ou en haut).';

  @override
  String get installFirefoxStep3 => 'Appuyez sur Installer.';

  @override
  String get installFirefoxStep4 =>
      'Confirmez en appuyant sur Ajouter ou sur Installer à nouveau.';

  @override
  String get installIos => 'iPhone/iOS :';

  @override
  String get installFirefoxIosContent =>
      'Firefox sur iOS n\'a pas de bouton direct \"Installer\" en raison des restrictions d\'Apple. Vous devez utiliser le menu système :';

  @override
  String get installFirefoxIosStep1 => 'Ouvrez le site Web dans Firefox.';

  @override
  String get installFirefoxIosStep2 =>
      'Appuyez sur l\'icône Partager (le carré avec une flèche vers le haut) dans la barre d\'adresse.';

  @override
  String get installFirefoxIosStep3 =>
      'Faites défiler la liste des options et appuyez sur Sur l\'écran d\'accueil.';

  @override
  String get installFirefoxIosStep4 => 'Appuyez sur Ajouter en haut à droite.';

  @override
  String get installChromeTitle => 'Chrome Mobile';

  @override
  String get installChromeAndroidStep1 =>
      'Ouvrez le site Web dans Chrome : https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installChromeAndroidStep2 =>
      'Appuyez sur les three points dans le coin supérieur droit.';

  @override
  String get installChromeAndroidStep3 =>
      'Appuyez sur Ajouter à l\'écran d\'accueil (dans certaines versions, cela peut être Installer l\'application).';

  @override
  String get installChromeAndroidStep4 =>
      'Appuyez sur Ajouter ou Installer pour confirmer.';

  @override
  String get installChromeIosStep1 => 'Ouvrez le site Web dans Chrome.';

  @override
  String get installChromeIosStep2 =>
      'Appuyez sur l\'icône Partager (le carré avec une flèche vers le haut) à côté de la barre d\'adresse.';

  @override
  String get installChromeIosStep3 =>
      'Faites défiler vers le bas et appuyez sur Sur l\'écran d\'accueil.';

  @override
  String get installChromeIosStep4 => 'Appuyez sur Ajouter en haut à droite.';

  @override
  String get installDesktopTitle => 'Bureau (Windows/Mac)';

  @override
  String get installDesktopStep1 => 'Ouvrez le site Web dans Chrome.';

  @override
  String get installDesktopStep2 =>
      'Cliquez sur les three points en haut à droite.';

  @override
  String get installDesktopStep3 => 'Sélectionnez Enregistrer et partager.';

  @override
  String get installDesktopStep4 =>
      'Cliquez sur Installer la page en tant qu\'application...';

  @override
  String get installDesktopStep5 => 'Cliquez sur Installer.';

  @override
  String get installSafariIosTitle => 'Pour Safari sur iPhone et iPad (iOS)';

  @override
  String get installSafariIosStep1 =>
      'Ouvrez le site Web dans Safari : https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installSafariIosStep2 =>
      'Appuyez sur le bouton Partager en bas (le carré avec une flèche vers le haut).';

  @override
  String get installSafariIosStep3 =>
      'Faites défiler le menu et appuyez sur Sur l\'écran d\'accueil.';

  @override
  String get installSafariIosStep4 => 'Appuyez sur Ajouter en haut à droite.';

  @override
  String get installSafariMacTitle => 'Pour Safari sur Mac (macOS)';

  @override
  String get installSafariMacNote =>
      'Remarque : cela nécessite macOS Sonoma ou une version ultérieure.';

  @override
  String get installSafariMacStep1 => 'Ouvrez le site Web dans Safari.';

  @override
  String get installSafariMacStep2 =>
      'Allez dans le menu Fichier dans la barre de menus en haut.';

  @override
  String get installSafariMacStep3 => 'Sélectionnez Ajouter au Dock...';

  @override
  String get installSafariMacStep4 => 'Cliquez sur Ajouter.';
}
