class Transaction {
  final String id;
  final String title;

  final double amount;
  final bool isCredit;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.isCredit,
    required this.date,
  });
}
