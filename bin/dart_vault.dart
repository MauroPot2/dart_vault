import 'dart:io';
import 'package:dart_vault/data/finance_manager.dart';
import 'package:dart_vault/models/transaction.dart';
import 'package:dart_vault/utility/transactiontype.dart';
import 'package:dart_vault/utility/print_all_transaction.dart';

void main() {
  var service = FinanceManager();

  print('---Benvenuto in Dart Vault---');

  //loop menu
  while (true) {
    print('\Scegli un\'opzione:');
    print('1. Visualizza tutto');
    print('2. Aggiungi entrata');
    print('3. Aggiungi spesa');
    print('4. Rimuovi transazione');
    print('5. Mostra saldo');
    print('0. Esci');
    stdout.write('--> ');

    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        service.printAllTransactions();
        break;
      case '2':
        _handleTransactionInput(service, TransactionType.income);
        break;
      case '3':
        _handleTransactionInput(service, TransactionType.expense);
        break;
      case '4':
        _handleRemoval(service);
        break;
      case '5':
        final saldo = service.calculateBalance();
        print('\n Saldo Attuale: €${saldo.toStringAsFixed(2)}');
        break;
      case '0':
        print('Chiusura in corso');
        exit(0);
      default:
        print('Scelta non valida');
    }
  }
}

void _handleTransactionInput(FinanceManager manager, TransactionType type) {
  stdout.write('Inserisci l\'importo: ');
  final amountInput = stdin.readLineSync() ?? '';
  final amount = double.tryParse(amountInput) ?? 0.0;

  if (amount <= 0) {
    print('Importo non valido!');
    return;
  }

  stdout.write('Inserisci la categoria: ');
  final category = stdin.readLineSync() ?? 'Generale';

  final t = Transaction(
    id: DateTime.now().millisecondsSinceEpoch,
    title: category,
    amount: amount,
    date: DateTime.now(),
    type: type,
  );

  manager.addTransaction(t);
  print('Operazione completata con successo!');
}

void _handleRemoval(FinanceManager manager) {
  stdout.write('Inserisci l\'id della transazione da rimuovere: ');
  final input = stdin.readLineSync();
  final id = int.tryParse(input ?? '');

  if (id == null) {
    print('ID non valido.');
    return;
  }
  manager.removeTransaction(id);
}
