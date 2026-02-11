import 'package:dart_vault/utility/transactiontype.dart';

class Transaction {
  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionType type;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      //date Json stringhe ISO-8601
      'date': date.toIso8601String(),
      //enum salvati come stringhe
      'type': type.name,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      type: json['type'] == 'income'
          ? TransactionType.income
          : TransactionType.expense,
    );
  }

  @override
  String toString() {
    return '$type: $title - €${amount.toStringAsFixed(2)} ($date)';
  }
}
