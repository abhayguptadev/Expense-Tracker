import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';


class Transactionlist extends StatelessWidget {
  const Transactionlist({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = context.watch<TransactionProvider>();
    if (transactionProvider.transaction.isEmpty) {
      return Center(
        child: Text("No Data Yet"),
      );
    }
    return ListView.builder(
      itemCount: transactionProvider.transaction.length,
      itemBuilder: (ctx, index) {
        final transaction = transactionProvider.transaction[index];
        return InkWell(
          onLongPress: () {
            transactionProvider.remove(index);
          },
          child: ListTile(
            title: Text(transaction.title),
            subtitle: Text(transaction.date.toString()),
            trailing: Text(
              '\Rs${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: transaction.isCredit ? Colors.green : Colors.red,
              ),
            ),
          ),
        );
      },
    );

  }
}
