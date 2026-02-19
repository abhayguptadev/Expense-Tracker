import 'package:flutter/material.dart';
import 'TransactionModal.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> _transactions = [];
  List<Transaction> get transaction => _transactions;

  double get totalCredit =>
      _transactions.where((t) => t.isCredit).fold(0, (sum, t) => sum + t.amount);

  double get totaldebit =>
      _transactions.where((t) => !t.isCredit).fold(0, (sum, t) => sum + t.amount);

  double get remainBalance => totalCredit - totaldebit;
  void addTransaction(String title, double amount, bool isCredit) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      isCredit: isCredit,
      date: DateTime.now(),
    );

    _transactions.insert(0, newTransaction);
    notifyListeners();
  }

  void remove(int index) {
    _transactions.removeAt(index);
    notifyListeners();
  }
}
