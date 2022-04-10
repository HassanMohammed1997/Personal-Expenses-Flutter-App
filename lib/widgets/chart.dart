import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ChartWidget({required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var item in recentTransactions) {
        if (_isSameDate(item, weekDay)) {
          totalSum += item.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  bool _isSameDate(Transaction recentTransaction, DateTime date) {
    return recentTransaction.date.day == date.day &&
        recentTransaction.date.month == date.month &&
        recentTransaction.date.year == date.year;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ChartBarWidget(
                    data['day'].toString(),
                    data['amount'] as double,
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
