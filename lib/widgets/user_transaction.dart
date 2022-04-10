import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction_input.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NewTransactionInput(_addNewTransaction),
        // TransactionList(_transactions),
      ],
    );
  }
}
