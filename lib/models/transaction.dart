//TODO-1 create Transaction class with constructor
//Transaction class must have id, amount, date, title

//TODO-2 Create an empty Transaction List in main.dart
class Transaction {
  String id;
  double amount;
  String title;
  DateTime date;

  Transaction(
      {required this.id,
      required this.amount,
      required this.date,
      required this.title});
}
