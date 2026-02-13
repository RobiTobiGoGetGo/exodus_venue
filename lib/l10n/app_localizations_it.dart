// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get nothingToUndo => 'Nulla da annullare!';

  @override
  String get noMatches => 'Nessun risultato trovato.';

  @override
  String get logNow => 'Registra ora';

  @override
  String get loggedCurrentTotals => 'Totali attuali registrati.';

  @override
  String get viewLog => 'Visualizza registro';

  @override
  String get exportLogs => 'Esporta registri';

  @override
  String get helpAndInfo => 'Aiuto e informazioni';

  @override
  String get resetSession => 'Ripristina sessione';

  @override
  String get setLocation => 'Imposta posizione';

  @override
  String get shutdown => 'Spegni';

  @override
  String get closeSession => 'Chiudi sessione';

  @override
  String get sessionClosed => 'Sessione chiusa e registrata.';

  @override
  String get exportAsCSV => 'Esporta come CSV';

  @override
  String get exportAsPDF => 'Esporta come PDF';

  @override
  String get previewReport => 'Anteprima rapporto';

  @override
  String get resetSessionQuestion => 'Ripristinare la sessione?';

  @override
  String get resetSessionContent =>
      'Vuoi ripristinare i contatori e il registro o esportare prima i dati?';

  @override
  String get justReset => 'Solo ripristino';

  @override
  String get exportFirst => 'Esporta prima';

  @override
  String get confirmFullReset => 'Conferma ripristino completo';

  @override
  String get confirmResetContent =>
      'Questa operazione cancellerà permanentemente il registro della sessione corrente e azzererà i contatori. L\'azione è irreversibile.';

  @override
  String get cancel => 'Annulla';

  @override
  String get sessionResetSuccess => 'Sessione ripristinata con successo.';

  @override
  String get resetEverything => 'RIPRISTINA TUTTO';

  @override
  String get setLocationName => 'Imposta nome posizione';

  @override
  String get locationNameHint => 'es. Ingresso principale';

  @override
  String get save => 'Salva';

  @override
  String get clear => 'CANCELLA';

  @override
  String get ok => 'OK';

  @override
  String get stillInside => 'Ancora all\'interno';

  @override
  String get entered => 'Entrati';

  @override
  String get validationExceedEntered =>
      'Il numero di persone all\'interno non può superare il totale degli ingressi!';

  @override
  String get validationLessInside =>
      'Il totale degli ingressi non può essere inferiore al numero di persone all\'interno!';

  @override
  String get capacity => 'Capacità';

  @override
  String get swipeToCount => 'Scorri verso l\'alto/basso per contare';

  @override
  String get search => 'Cerca';

  @override
  String get deleteEntryQuestion => 'Eliminare questa voce?';

  @override
  String get delete => 'Elimina';

  @override
  String get deleteAllEntriesQuestion => 'Eliminare TUTTE le voci?';

  @override
  String get thisCannotBeUndone => 'Questa operazione è irreversibile.';

  @override
  String get deleteAll => 'ELIMINA TUTTO';

  @override
  String get userGuideTitle => 'Guida utente Exodus';

  @override
  String get guideOverviewTitle => '1. Panoramica';

  @override
  String get guideOverviewContent =>
      'Exodus è uno strumento professionale per la gestione degli ingressi nelle sedi. Tiene traccia di due numeri principali:';

  @override
  String get guideOverviewEntered =>
      'Totale entrati: Numero cumulativo di tutte le persone che sono entrate.';

  @override
  String get guideOverviewInside =>
      'Ancora all\'interno: Numero attuale di persone rimaste nella sede.';

  @override
  String get guideDashboardTitle => '2. La dashboard';

  @override
  String get guideDashboardContent =>
      'La schermata principale fornisce informazioni in tempo reale:';

  @override
  String get guideDashboardHeader =>
      'Intestazione: Mostra il logo della sede. Premi a lungo per aprire questa guida.';

  @override
  String get guideDashboardLocation =>
      'Posizione: Visualizzata sotto il logo. Premi a lungo per rinominare.';

  @override
  String get guideDashboardCapacity =>
      'Capacità: Visualizzata accanto alla posizione. Premi a lungo per modificare.';

  @override
  String get guideDashboardEnteredCard =>
      'Scheda Entrati (Blu): Mostra il totale degli ingressi.';

  @override
  String get guideDashboardInsideCard =>
      'Scheda Ancora all\'interno (Verde): Mostra l\'occupazione attuale.';

  @override
  String get guideSafetyTitle => '3. Capacità e sicurezza';

  @override
  String get guideSafetyContent => 'L\'app monitora i limiti di sicurezza:';

  @override
  String get guideSafetyTransition =>
      'La scheda \'Ancora all\'interno\' diventa rossa quando ci si avvicina alla capacità massima.';

  @override
  String get guideSafetyThreshold =>
      'L\'avviso inizia al 2% o 10 persone prima del limite.';

  @override
  String get guideSafetySignal =>
      'Una scheda completamente rossa indica che la sede ha raggiunto o superato la capacità.';

  @override
  String get guideInputTitle => '4. Metodi di input';

  @override
  String get guideInputContent =>
      'Passa tra due modalità usando le icone in alto:';

  @override
  String get guideInputButtonTitle => 'Modalità Pulsante (Predefinita)';

  @override
  String get guideInputButtonTapEntered =>
      'Tocca [+] per incrementare entrambi i contatori (una persona entra).';

  @override
  String get guideInputButtonTapInside =>
      'Tocca [-] per decrementare \'Ancora all\'interno\' (una persona esce).';

  @override
  String get guideInputButtonBestFor =>
      'Ideale per: Conteggio ad alta precisione a varchi fissi.';

  @override
  String get guideInputSwipeTitle => 'Modalità Scorrimento (Gesti)';

  @override
  String get guideInputSwipeUp =>
      'Scorri verso l\'alto in qualsiasi punto per incrementare entrambi i contatori.';

  @override
  String get guideInputSwipeDown =>
      'Scorri verso il basso in qualsiasi punto per decrementare \'Ancora all\'interno\'.';

  @override
  String get guideInputSwipeBestFor =>
      'Ideale per: Monitoraggio degli ingressi frenetico dove gli occhi devono rimanere sulla folla.';

  @override
  String get guideCorrectionTitle => '5. Correzioni';

  @override
  String get guideCorrectionContent =>
      'Gli errori possono essere corretti in due modi:';

  @override
  String get guideCorrectionUndo =>
      'Annulla: Tocca l\'icona della freccia circolare in alto a sinistra per annullare l\'ultima azione.';

  @override
  String get guideCorrectionManual =>
      'Modifica manuale: Premi a lungo su qualsiasi numero della dashboard per inserire un valore specifico usando il tastierino sicuro.';

  @override
  String get guideLogTitle => '6. Registro e reportistica';

  @override
  String get guideLogContent => 'Ogni azione viene registrata con data e ora:';

  @override
  String get guideLogSearch =>
      'Cerca: Usa la lente d\'ingrandimento per trovare eventi specifici (es. \'MANUAL\').';

  @override
  String get guideLogDelete =>
      'Elimina: Premi a lungo su una voce del registro per rimuoverla.';

  @override
  String get guideLogExport =>
      'Esporta: Usa l\'icona di condivisione per generare report PDF o fogli di calcolo CSV.';

  @override
  String get guideLogPreview =>
      'Anteprima: Visualizza il layout del report prima della condivisione.';

  @override
  String get guideSessionTitle => '7. Gestione della sessione';

  @override
  String get guideSessionResetTitle => 'Ripristina sessione';

  @override
  String get guideSessionResetContent =>
      'Cancella tutti i dati per un nuovo giorno.';

  @override
  String get guideSessionResetExport =>
      'L\'app ti chiederà se vuoi prima esportare i tuoi dati.';

  @override
  String get guideSessionResetConfirm =>
      'Richiede una doppia conferma per evitare perdite accidentali.';

  @override
  String get guideSessionShutdownTitle => 'Spegni';

  @override
  String get guideSessionShutdownContent =>
      'Registra correttamente la fine del lavoro e chiude l\'applicazione.';

  @override
  String get installGuideTitle => 'Exodus Venue: Guida all\'installazione';

  @override
  String get installMobileTitle => 'Installazione su telefoni cellulari';

  @override
  String get installEdgeTitle => 'Edge Mobile';

  @override
  String get installEdgeStep1 =>
      'Apri il sito web in Edge: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installEdgeStep2 =>
      'Tocca le tre linee orizzontali o i tre punti in basso a destra.';

  @override
  String get installEdgeStep3 =>
      'Scorri verso l\'alto (o lateralmente) nel menu che appare per vedere altre opzioni.';

  @override
  String get installEdgeStep4 =>
      'Cerca e tocca Aggiungi al telefono (potrebbe anche dire Installa app o Aggiungi alla schermata Home).';

  @override
  String get installEdgeStep5 =>
      'Segui le istruzioni per confermare il nome \"Exodus Venue\" e tocca Aggiungi.';

  @override
  String get installFirefoxTitle => 'Firefox Mobile';

  @override
  String get installAndroid => 'Android:';

  @override
  String get installFirefoxStep1 =>
      'Apri il sito web in Firefox: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installFirefoxStep2 =>
      'Tocca i tre punti (menu) accanto alla barra degli indirizzi (di solito in basso o in alto).';

  @override
  String get installFirefoxStep3 => 'Tocca Installa.';

  @override
  String get installFirefoxStep4 =>
      'Conferma toccando Aggiungi o Installa di nuovo.';

  @override
  String get installIos => 'iPhone/iOS:';

  @override
  String get installFirefoxIosContent =>
      'Firefox su iOS non ha un pulsante diretto \"Installa\" a causa delle restrizioni di Apple. Devi usare il menu di sistema:';

  @override
  String get installFirefoxIosStep1 => 'Apri il sito web in Firefox.';

  @override
  String get installFirefoxIosStep2 =>
      'Tocca l\'icona Condividi (il quadrato con una freccia rivolta verso l\'alto) nella barra degli indirizzi.';

  @override
  String get installFirefoxIosStep3 =>
      'Scorri l\'elenco delle opzioni e tocca Aggiungi alla schermata Home.';

  @override
  String get installFirefoxIosStep4 => 'Tocca Aggiungi in alto a destra.';

  @override
  String get installChromeTitle => 'Chrome Mobile';

  @override
  String get installChromeAndroidStep1 =>
      'Apri il sito web in Chrome: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installChromeAndroidStep2 => 'Tocca i tre punti in alto a destra.';

  @override
  String get installChromeAndroidStep3 =>
      'Tocca Aggiungi alla schermata Home (in alcune versioni, potrebbe dire Installa app).';

  @override
  String get installChromeAndroidStep4 =>
      'Tocca Aggiungi o Installa per confermare.';

  @override
  String get installChromeIosStep1 => 'Apri il sito web in Chrome.';

  @override
  String get installChromeIosStep2 =>
      'Tocca l\'icona Condividi (il quadrato con una freccia rivolta verso l\'alto) accanto alla barra degli indirizzi.';

  @override
  String get installChromeIosStep3 =>
      'Scorri verso il basso e tocca Aggiungi alla schermata Home.';

  @override
  String get installChromeIosStep4 => 'Tocca Aggiungi in alto a destra.';

  @override
  String get installDesktopTitle => 'Desktop (Windows/Mac)';

  @override
  String get installDesktopStep1 => 'Apri il sito web in Chrome.';

  @override
  String get installDesktopStep2 => 'Fai clic sui tre punti in alto a destra.';

  @override
  String get installDesktopStep3 => 'Seleziona Salva e condividi.';

  @override
  String get installDesktopStep4 => 'Fai clic su Installa pagina come app...';

  @override
  String get installDesktopStep5 => 'Fai clic su Installa';

  @override
  String get installSafariIosTitle => 'Per Safari su iPhone e iPad (iOS)';

  @override
  String get installSafariIosStep1 =>
      'Apri il sito web in Safari: https://RobiTobiGoGetGo.github.io/exodus_venue/';

  @override
  String get installSafariIosStep2 =>
      'Tocca il pulsante Condividi in basso (il quadrato con una freccia rivolta verso l\'alto).';

  @override
  String get installSafariIosStep3 =>
      'Scorri il menu e tocca Aggiungi alla schermata Home.';

  @override
  String get installSafariIosStep4 => 'Tocca Aggiungi in alto a destra.';

  @override
  String get installSafariMacTitle => 'Per Safari su Mac (macOS)';

  @override
  String get installSafariMacNote =>
      'Nota: questo richiede macOS Sonoma o versioni successive.';

  @override
  String get installSafariMacStep1 => 'Apri il sito web in Safari.';

  @override
  String get installSafariMacStep2 =>
      'Vai al menu File nella barra dei menu in alto.';

  @override
  String get installSafariMacStep3 => 'Seleziona Aggiungi al Dock...';

  @override
  String get installSafariMacStep4 => 'Fai clic su Aggiungi.';
}
