import 'package:abhinash_trexis/bloc/statements/statements_state.dart';
import 'package:abhinash_trexis/model/statement_model.dart';
import 'package:abhinash_trexis/network/call_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatementsBloc extends Cubit<StatementsState> {
  final GraphQLRepository repository;

  StatementsBloc(this.repository) : super(StatementsInitialState());

  void getStatementstDetails() async {
    emit(StatementsLoadingState());
    try {
      final result = await repository.fetchFromApi(r'''
query getStatements {
  statements {
    date
    description
    amount
  }
}
    ''');

      if (result.hasException) {
        emit(StatementsErrorState(result.exception.toString()));
      } else {
        List<Statement> satementsData =
            statementMapFrom(result.data!['statements']);

        emit(StatementsLoadedState(satementsData));
      }
    } catch (e) {
      emit(StatementsErrorState(e.toString()));
    }
  }
}
