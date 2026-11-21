# Dart Vault

Piccola applicazione a riga di comando per registrare entrate e spese e consultare il saldo complessivo. Il progetto è scritto in Dart e salva i dati in un file JSON locale.

## Funzionalità

- Aggiunta di transazioni di entrata e uscita
- Visualizzazione e rimozione delle transazioni
- Calcolo del saldo
- Caricamento e salvataggio dei dati tra un'esecuzione e l'altra

## Struttura

- `bin/dart_vault.dart`: menu interattivo da terminale
- `lib/models/`: modello delle transazioni
- `lib/data/finance_manager.dart`: operazioni sui dati e persistenza JSON
- `lib/utility/`: funzioni di supporto

## Avvio

Richiede Dart SDK compatibile con `pubspec.yaml`.

~~~bash
dart pub get
dart run bin/dart_vault.dart
~~~

Le transazioni vengono salvate nel file `dartvault.json` della directory corrente. Effettuare una copia del file se si desidera conservare i dati prima di modificarli o cancellarli.

## Verifiche

~~~bash
dart analyze
~~~

## Limiti

Applicazione didattica locale: non prevede accesso multiutente, sincronizzazione cloud o cifratura del file dati. Gli importi sono gestiti come numeri in virgola mobile, quindi non va considerata un sistema contabile per uso professionale.
