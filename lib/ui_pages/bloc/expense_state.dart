import 'package:expense/data/models/expense_mdel.dart';



abstract class ExpenseState{}

class InitialsState extends ExpenseState{}

class LoadingState extends ExpenseState{}

class LoadedState extends ExpenseState{
  List<ExpenseModel> mExp=[];
  LoadedState({required this.mExp});
}
class ErrorState extends ExpenseState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}