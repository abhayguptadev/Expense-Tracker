import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'provider.dart';
import 'TransactionModal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionModalAdapter());

  await Hive.openBox<TransactionModal>('transactionsBox');

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