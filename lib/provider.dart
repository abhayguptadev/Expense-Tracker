import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'TransactionModal.dart';

class TransactionProvider extends ChangeNotifier {
  static const String _boxname = "transactionsBox";

  List<TransactionModal> _transactions = [];
  List<TransactionModal> get transaction => _transactions;

  late Box<TransactionModal> _box;

  TransactionProvider() {
    _init();
  }

  Future<void> _init() async {
    _box = Hive.box<TransactionModal>(_boxname);
    _transactions = _box.values.toList();
    notifyListeners();
  }

  double get totalCredit =>
      _transactions.where((t) => t.isCredit).fold(0, (sum, t) => sum + t.amount);

  double get totaldebit =>
      _transactions.where((t) => !t.isCredit).fold(0, (sum, t) => sum + t.amount);

  double get remainBalance => totalCredit - totaldebit;

  void addTransaction(String title, double amount, bool isCredit) {
    final newTransaction = TransactionModal(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      isCredit: isCredit,
      date: DateTime.now(),
    );

    _transactions.insert(0, newTransaction);
    _box.add(newTransaction);
    notifyListeners();
  }

  void remove(int index) {
    _box.deleteAt(index);
    _transactions.removeAt(index);
    notifyListeners();
  }
}