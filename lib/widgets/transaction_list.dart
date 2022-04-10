import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactionFunc;

  TransactionList(this.transactions, this.deleteTransactionFunc);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 56),
              itemBuilder: (ctx, idx) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text('\$${transactions[idx].amount}')),
                      ),
                    ),
                    title: Text(transactions[idx].title),
                    subtitle: Text(
                        DateFormat.MMMMEEEEd().format(transactions[idx].date)),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () {
                        deleteTransactionFunc(transactions[idx].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
