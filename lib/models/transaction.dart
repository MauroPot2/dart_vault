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

  @override
  String toString() {
    return '$type: $title - €${amount.toStringAsFixed(2)} ($date)';
  }
}
