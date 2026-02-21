import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'package:cash_flow/HomePage.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titlecontroller = TextEditingController();
  final amountcontrooler = TextEditingController();
  bool isCredit = true;
  void submitData() {
    final title = titlecontroller.text.trim();
    final amount = double.tryParse(amountcontrooler.text.trim());

    if (title.isEmpty || amount == null || amount <= 0) {
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Both Are Required")));
      return;
    } else {
      context.read<TransactionProvider>().addTransaction(
        title,
        amount,
        isCredit,
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: titlecontroller,
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 25),

          TextField(
            controller: amountcontrooler,
            decoration: InputDecoration(
              labelText: "Amount",
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Debit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCredit == false ? Colors.red : Colors.black,
                ),
              ),

              SizedBox(width: 35),
              Switch(
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.red,
                inactiveThumbColor: Colors.white,
                activeThumbColor: Colors.white,
                value: isCredit,
                onChanged: (value) => setState(() {
                  isCredit = value;
                }),
              ),
              SizedBox(width: 35),
              Text(
                "Credit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCredit == true ? Colors.green : Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text("Add Transaction", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
