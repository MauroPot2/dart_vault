import 'package:dart_vault/models/transaction.dart';

class FinanceManager {
  //inizializzo list
  final List<Transaction> _transaction = [];
  // transazione per aggiungere
  void addTransaction(Transaction t) {
    _transaction.add(t);
    print("Transazione aggiunta: ${t.title}");
  }

  // transazione per rimuovere
  bool removeTransaction(int id) {
    int index = _transaction.indexWhere((t) => t.id == id);
    if (index == -1) {
      print('Errore: ID $id non trovato');
      return false;
    } else {
      Transaction removedItem = _transaction.removeAt(index);
      print('Rimossa transazione: ${removedItem.title}');
      return true;
    }
  }

  List<Transaction> get allTransaction => _transaction;
}
