import 'package:flutter/material.dart';
import 'provider.dart';
import 'package:provider/provider.dart';


class CardSummary extends StatelessWidget {
  const CardSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = context.watch<TransactionProvider>();


    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            const Text("Your Report", style: TextStyle(fontWeight: .bold, fontSize: 20),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Total Credit: \Rs${transactionProvider.totalCredit.toStringAsFixed(2)}",),
                Text('Total Debit: \Rs${transactionProvider.totaldebit.toStringAsFixed(2)}',),
              ],
            ),
            const SizedBox(height: 40,),
            Text("Remain Balance: \Rs${transactionProvider.remainBalance.toStringAsFixed(2)}",style: TextStyle(fontWeight: .bold, fontSize: 20),)

          ],
        ),
      ),
    );
  }
}
