import 'package:hive/hive.dart';
part 'TransactionModal.g.dart';

@HiveType(typeId: 0)
class TransactionModal  {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final bool isCredit;

  @HiveField(4)
  final DateTime date;

  TransactionModal ({
    required this.id,
    required this.title,
    required this.amount,
    required this.isCredit,
    required this.date,
  });
}
