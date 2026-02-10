import 'package:dart_vault/data/finance_manager.dart';
import 'package:dart_vault/models/transaction.dart';
import 'package:dart_vault/utility/transactiontype.dart';

void main () {
  
var service = FinanceManager();

var transaction1 = Transaction(id: 1, title: 'Tavolo 1', amount: 192.45, date: DateTime(2026,2,10), type: TransactionType.expense);

service.addTransaction(transaction1);
print(service.allTransaction);


bool risultato1 = service.removeTransaction(1);
print('Esito rimozione ID 1: $risultato1');

print(service.allTransaction);

}