import 'package:abhinash_trexis/model/transaction_model.dart';

// States
abstract class TransactionsState {}

class TransactionsInitialState extends TransactionsState {}

class TransactionsLoadingState extends TransactionsState {}

class TransactionsLoadedState extends TransactionsState {
  final List<Transaction>? transactions;

  TransactionsLoadedState(this.transactions);
}

class TransactionsErrorState extends TransactionsState {
  final String error;

  TransactionsErrorState(this.error);
}
