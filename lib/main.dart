import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';
import 'package:flutter_complete_guide/widgets/new_transaction_input.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
          fontFamily: 'Quicksand',
          appBarTheme: const AppBarTheme(
              toolbarTextStyle: TextStyle(fontFamily: 'OpenSans'))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "1", amount: 15.7, date: DateTime.now(), title: "New Shoes"),
    Transaction(
        id: "2", amount: 20.5, date: DateTime.now(), title: "Transport"),
    Transaction(
        id: "2", amount: 20.5, date: DateTime.now(), title: "Transport"),
    Transaction(
        id: "2", amount: 20.5, date: DateTime.now(), title: "Transport"),
    Transaction(
        id: "2", amount: 20.5, date: DateTime.now(), title: "Transport"),
    Transaction(
        id: "2", amount: 20.5, date: DateTime.now(), title: "Transport"),
    Transaction(
        id: "2", amount: 20.5, date: DateTime.now(), title: "Transport"),
  ];

  List<Transaction> get _recentTransaction {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime selectedDate) {
    final newTransaction = Transaction(
      amount: amount,
      title: title,
      date: selectedDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  void _startAddNewTransactionBottomSheet(
    BuildContext ctx,
  ) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransactionInput(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        "Personal Expenses",
        style: TextStyle(fontFamily: 'Opensans'),
      ),
      actions: [
        IconButton(
          onPressed: () => {_startAddNewTransactionBottomSheet(context)},
          icon: const Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.32,
                child: ChartWidget(recentTransactions: _recentTransaction)),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) * 0.7,
                child: TransactionList(_transactions, _removeTransaction)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_startAddNewTransactionBottomSheet(context)},
        mini: false,
        isExtended: true,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
