import 'dart:convert';
import 'dart:io';

import 'package:dart_vault/models/transaction.dart';
import 'package:dart_vault/utility/transactiontype.dart';

class FinanceManager {
  //file di salvataggio
  final String _fileName = 'dartvault.json';
  //inizializzo list
  List<Transaction> _transaction = [];
  
  //carica i dati
  FinanceManager(){
    loadData();
  }

  // -- LOGICA DI SALVATAGGIO --
  void saveData(){
    // trasforma List<Transaction> in List<Map>
    List<Map<String, dynamic>> dataMap = _transaction
      .map((t) => t.toJson())
      .toList();

      //trasforma List<Map> in Stringa JSON
      String jsonString = jsonEncode(dataMap);

      //Scrive stringa sul file
      File(_fileName).writeAsStringSync(jsonString);
      print('--> Dati salvati su $_fileName');
  }

  void loadData(){
    File file = File(_fileName);

    if(!file.existsSync()){
      print('Nessun dato salvato trovato. Inizializzo lista vuota');
      return;
    }
    try{

      String jsonString = file.readAsStringSync();

      List<dynamic> decodedList = jsonDecode(jsonString);

      _transaction = decodedList
        .map((item)=> Transaction.fromJson(item))
        .toList();

        print('Dati caricati: ${_transaction.length} transazioni.');
    } catch (e){
      print('Errore nel caricamento dei dati: $e');
    }
  }

  // -- LOGICHE CRUD -- 
  // transazione per aggiungere
  void addTransaction(Transaction t) {
    _transaction.add(t);
    print("Transazione aggiunta: ${t.title}");
    saveData();
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
      saveData();
      return true;
    }
  }

  //entrate
  List<Transaction> getIncomes(){
    return _transaction
      .where((t)=> t.type == TransactionType.income)
      .toList();
  }

  //uscite
  List<Transaction> getExpenses(){
    return _transaction
      .where((t) => t.type == TransactionType.expense)
      .toList();
  }

  //saldo
  double calculateBalance(){
    return _transaction.fold(0.0, (currentTotal, t){
      if(t.type == TransactionType.income){
        return currentTotal + t.amount;
      }else {
        return currentTotal - t.amount;
      }
    });
  }

  List<Transaction> get allTransaction => _transaction;
}
