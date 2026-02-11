// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Exodus';

  @override
  String get entered => 'Entrato';

  @override
  String get stillInside => 'Ancora dentro';

  @override
  String get capacity => 'Capacità';

  @override
  String get resetSession => 'Reimposta sessione';

  @override
  String get exportLogs => 'Esporta registri';

  @override
  String get helpAndInfo => 'Aiuto e info';

  @override
  String get setLocation => 'Imposta posizione';

  @override
  String get shutdown => 'Spegni';

  @override
  String get closeSession => 'Chiudi sessione';

  @override
  String get logNow => 'Registra ORA';

  @override
  String get viewLog => 'Visualizza registro';

  @override
  String get exportAsCSV => 'Esporta come CSV';

  @override
  String get exportAsPDF => 'Esporta come PDF';

  @override
  String get previewReport => 'Anteprima rapporto';

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get ok => 'OK';

  @override
  String get clear => 'CLR';

  @override
  String get nothingToUndo => 'Nulla da annullare';

  @override
  String get loggedCurrentTotals => 'Totali attuali registrati';

  @override
  String get sessionClosed => 'Sessione chiusa';

  @override
  String get resetEverything => 'Reimposta tutto';

  @override
  String get sessionResetSuccess => 'Sessione reimpostata con successo';

  @override
  String get resetSessionQuestion => 'Reimpostare la sessione?';

  @override
  String get resetSessionContent =>
      'Vuoi esportare il registro attuale prima di reimpostare?';

  @override
  String get justReset => 'Solo reimposta';

  @override
  String get exportFirst => 'Esporta prima';

  @override
  String get confirmFullReset => 'Conferma reimpostazione completa';

  @override
  String get confirmResetContent =>
      'Questo cancellerà TUTTI i registri e azzererà i contatori. L\'operazione non può essere annullata.';

  @override
  String get setLocationName => 'Imposta nome posizione';

  @override
  String get locationNameHint => 'es. Ingresso principale';

  @override
  String get validationExceedEntered => 'Non può superare \'Entrato\'';

  @override
  String get validationLessInside =>
      'Non può essere inferiore a \'Ancore dentro\'';

  @override
  String get deleteEntryQuestion => 'Eliminare l\'entrata?';

  @override
  String get delete => 'Elimina';

  @override
  String get deleteAllEntriesQuestion => 'Eliminare tutte le entrate?';

  @override
  String get thisCannotBeUndone => 'L\'operazione non può essere annullata.';

  @override
  String get deleteAll => 'Elimina tutto';

  @override
  String get noMatches => 'Nessun risultato';

  @override
  String get search => 'Cerca registri...';

  @override
  String get swipeToCount => 'Scorri su/giù per contare';

  @override
  String get userGuideTitle => 'EXODUS VENUE DASHBOARD: GUIDA UTENTE';

  @override
  String get guideOverviewTitle => '1. PANORAMICA';

  @override
  String get guideOverviewContent =>
      'Exodus è uno strumento professionale per il monitoraggio delle presenze. Il suo scopo è tracciare il flusso di visitatori attraverso un ingresso o un\'uscita specifica. A differenza di un normale \'contapersone\', gestisce due valori contemporaneamente per fornire una visione in tempo reale della sicurezza e della capacità della struttura.';

  @override
  String get guideOverviewEntered =>
      'Entrate: Il totale cumulativo di tutte le persone che sono passate attraverso il cancello. Questo numero aumenta solo e rappresenta il \'Flusso Totale\'.';

  @override
  String get guideOverviewInside =>
      'Ancora Dentro: Il numero attuale di persone rimaste all\'interno della struttura. Questo numero aumenta quando le persone entrano e diminuisce quando se ne vanno.';

  @override
  String get guideDashboardTitle => '2. LA DASHBOARD PRINCIPALE (HOME SCREEN)';

  @override
  String get guideDashboardContent =>
      'Questa è la schermata principale dove il supervisore trascorrerà il 99% del suo tempo.';

  @override
  String get guideDashboardHeader =>
      'Intestazione con Marchio: Presenta il logo Exodus. Tenendo premuto a lungo questo logo, si accede a una scorciatoia rapida per la schermata di Aiuto.';

  @override
  String get guideDashboardLocation =>
      'Riga Posizione: Mostra il nome del cancello attuale (es. \'Ingresso Nord\'). Ciò garantisce che se vengono utilizzati più telefoni, i registri siano attribuiti correttamente.';

  @override
  String get guideDashboardCapacity =>
      'Riga Capacità: Mostra la \'Capacità Massima\' o il limite di sicurezza per l\'area.';

  @override
  String get guideDashboardEnteredCard =>
      'Scheda Entrate (Blu): Ampio display del totale delle entrate.';

  @override
  String get guideDashboardInsideCard =>
      'Scheda Ancora Dentro (Verde/Bianco): Ampio display del numero attuale di persone.';

  @override
  String get guideSafetyTitle => 'Indicatori Visivi di Sicurezza';

  @override
  String get guideSafetyContent =>
      'La scheda Ancora Dentro utilizza una logica \'heat-map\' per avvisare il supervisore di un potenziale sovraffollamento senza che debba leggere i numeri:';

  @override
  String get guideSafetyTransition =>
      'Man mano che il numero di persone si avvicina alla Capacità Massima, la scheda passerà gradualmente da un bianco neutro a un rosso sfumato.';

  @override
  String get guideSafetyThreshold =>
      'Questo avviso inizia quando lo spazio rimanente è di 10 persone o del 2% della capacità totale (a seconda di quale sia maggiore).';

  @override
  String get guideSafetySignal =>
      'Una scheda di colore rosso intenso è un segnale per il supervisore di rallentare o interrompere le entrate.';

  @override
  String get guideInputTitle => '3. MODALITÀ DI INPUT (COME CONTARE)';

  @override
  String get guideInputContent =>
      'Nella parte superiore della dashboard, sono presenti due icone per cambiare il metodo di inserimento in base alla situazione.';

  @override
  String get guideInputButtonTitle =>
      'A. Modalità Pulsante (Icona: Dito che tocca)';

  @override
  String get guideInputButtonTapEntered =>
      'Tocca [+] sulla scheda blu per un\'entrata.';

  @override
  String get guideInputButtonTapInside =>
      'Tocca [-] sulla scheda verde per un\'uscita.';

  @override
  String get guideInputButtonBestFor =>
      'Ideale per: Traffico costante e gestibile dove è richiesta un\'alta precisione.';

  @override
  String get guideInputSwipeTitle =>
      'B. Modalità Scorrimento (Icona: Mano che scorre)';

  @override
  String get guideInputSwipeUp =>
      'Scorri verso l\'ALTO in qualsiasi punto dello schermo per registrare un\'entrata.';

  @override
  String get guideInputSwipeDown =>
      'Scorri verso il BASSO in qualsiasi punto dello schermo per registrare un\'uscita.';

  @override
  String get guideInputSwipeBestFor =>
      'Ideale per: Folle in rapido movimento o \'picchi\' dove il supervisore deve tenere gli occhi sui visitatori piuttosto che sullo schermo.';

  @override
  String get guideCorrectionTitle => '4. CORREZIONE E NAVIGAZIONE';

  @override
  String get guideCorrectionContent =>
      'Gli errori capitano, specialmente durante i turni intensi. Exodus fornisce due livelli di correzione:';

  @override
  String get guideCorrectionUndo =>
      'Annulla (Icona in alto a sinistra): Toccando la freccia curva si annulla istantaneamente l\'ultima azione eseguita (conteggio o modifica).';

  @override
  String get guideCorrectionManual =>
      'Modifica Manuale (Tastierino): Tenendo premuto a lungo la scheda Entrate o Ancora Dentro si apre un tastierino numerico. Questo permette al supervisore di inserire un numero confermato di persone (es. dopo un controllo manuale dei locali).';

  @override
  String get guideLogTitle => '5. CRONOLOGIA REGISTRI E REPORTISTICA';

  @override
  String get guideLogContent =>
      'Ogni azione viene registrata con un timestamp. Per accedere al registro, tocca l\'icona dell\'Ingranaggio e seleziona Visualizza Registro, oppure usa la scorciatoia con la pressione prolungata sull\'icona dell\'Ingranaggio.';

  @override
  String get guideLogSearch =>
      'Ricerca: Usa la barra in alto per filtrare eventi specifici come \'RESET\' o \'MODIFICA MANUALE\'.';

  @override
  String get guideLogDelete =>
      'Elimina: Le singole voci possono essere rimosse tenendole premute a lungo (richiede conferma).';

  @override
  String get guideLogExport =>
      'Esportazione: Puoi condividere i registri come CSV (per Excel) o PDF formattato.';

  @override
  String get guideLogPreview =>
      'Anteprima: L\'opzione \'Anteprima Rapporto\' ti permette di vedere il layout professionale del PDF prima di inviarlo tramite WhatsApp o Email.';

  @override
  String get guideSessionTitle => '6. GESTIONE DELLA SESSIONE';

  @override
  String get guideSessionResetTitle => 'Reimpostazione del Giorno';

  @override
  String get guideSessionResetContent =>
      'Per azzerare i contatori per un nuovo turno o evento, seleziona Reimposta Sessione dal menu Ingranaggio.';

  @override
  String get guideSessionResetExport =>
      'L\'app chiederà prima se desideri Esportare i dati per non perdere i record della sessione precedente.';

  @override
  String get guideSessionResetConfirm =>
      'È richiesta una conferma finale prima che l\'app cancelli i contatori portandoli a 0 e svuoti la cronologia dei registri.';

  @override
  String get guideSessionShutdownTitle => 'Spegni';

  @override
  String get guideSessionShutdownContent =>
      'Selezionando Spegni si crea una voce di registro finale per chiudere la traccia digitale e si esce dall\'app in modo pulito.';

  @override
  String get installGuideTitle => 'EXODUS VENUE: GUIDA ALL\'INSTALLAZIONE';

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
