import 'package:flutter/material.dart';
import 'addTrasaction.dart';
import 'TransactionList.dart';
import 'card_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cash Flow"), elevation: 0, centerTitle: true),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          CardSummary(),
          const SizedBox(height: 20),
          Expanded(child: Transactionlist()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddTransaction(),
          );
        },
        tooltip: "Add Transaction",
        hoverColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
