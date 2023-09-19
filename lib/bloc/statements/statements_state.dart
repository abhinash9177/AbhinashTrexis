import 'package:abhinash_trexis/model/statement_model.dart';

// States
abstract class StatementsState {}

class StatementsInitialState extends StatementsState {}

class StatementsLoadingState extends StatementsState {}

class StatementsLoadedState extends StatementsState {
  final List<Statement>? statements;

  StatementsLoadedState(this.statements);
}

class StatementsErrorState extends StatementsState {
  final String error;

  StatementsErrorState(this.error);
}
