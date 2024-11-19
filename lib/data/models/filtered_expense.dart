import 'package:expense/data/models/expense_mdel.dart';


class FilteredExpenseModel{
  String title;
  num totalAmt;
  List<ExpenseModel> allExp;
  FilteredExpenseModel({required this.title,required this.totalAmt,required this.allExp});
}