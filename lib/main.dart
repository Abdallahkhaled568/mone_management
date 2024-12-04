import 'package:flutter/material.dart';
import 'exchange_screen.dart';
import 'transfer_screen.dart';
import 'receive_screen.dart';

void main() {
  runApp(MoneyTransferApp());
}

class MoneyTransferApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Transfer App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Money Transfer App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Exchange', icon: Icon(Icons.swap_horiz)),
              Tab(text: 'Transfer', icon: Icon(Icons.send)),
              Tab(text: 'Receive', icon: Icon(Icons.download)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ExchangeScreen(),
            TransferScreen(),
            ReceiveScreen(),
          ],
        ),
      ),
    );
  }
}