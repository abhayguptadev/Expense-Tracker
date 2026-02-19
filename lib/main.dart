import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';

import 'provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cash Flow",
        home: HomeBody(),
      ),
    );
  }
}
