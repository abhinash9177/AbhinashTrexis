import 'package:abhinash_trexis/bloc/transactions/transactions_state.dart';
import 'package:abhinash_trexis/model/transaction_model.dart';
import 'package:abhinash_trexis/network/call_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsBloc extends Cubit<TransactionsState> {
  final GraphQLRepository repository;

  TransactionsBloc(this.repository) : super(TransactionsInitialState());

  void getTransactionstDetails() async {
    emit(TransactionsLoadingState());
    try {
      final result = await repository.fetchFromApi(r'''
query getTransactions {
  transactions {
    date
    description
    amount
    fromAccount
    toAccount
  }
}
    ''');
      //print(result);
      if (result.hasException) {
        emit(TransactionsErrorState(result.exception.toString()));
      } else {
        if (result.data!['transactions'] != null) {
          List<Transaction> transactionsData =
              transactionMapFrom(result.data!['transactions']);
          //print(transactionsData);
          // List<Account> newaccount = accountMapFrom(result.data!['Transactions']);
          // print(TransactionsData.address!.postCode.toString());
          emit(TransactionsLoadedState(transactionsData));
        } else {
          emit(TransactionsErrorState('Error getting Transactions.'));
        }
      }
    } catch (e) {
      emit(TransactionsErrorState(e.toString()));
    }
  }
}
