import 'package:dart_vault/data/finance_manager.dart';


extension FinanceManagerDisplay on FinanceManager {
  
  void printAllTransactions() {
    print('\n--- Lista Transazioni ---');
    
    if (allTransaction.isEmpty) {
      print('Nessuna transazione registrata.');
      return; 
    }

    for (var t in allTransaction) {
      print(_formatLine(t));
    }
  }

  String _formatLine(dynamic t) {
    return '[ID: ${t.id.toString().padLeft(3, '0')}] ${t.toString()}';
  }
}