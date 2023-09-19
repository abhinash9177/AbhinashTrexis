import 'package:abhinash_trexis/bloc/accounts/accounts_state.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:abhinash_trexis/network/call_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsBloc extends Cubit<AccountsState> {
  final GraphQLRepository repository;

  AccountsBloc(this.repository) : super(AccountsInitialState());

  void getAccountDetails() async {
    emit(AccountsLoadingState());
    try {
      final result = await repository.fetchFromApi(r'''
      query getAccounts {
        accounts {
          id
          accountNumber
          accountType
          balance
          accountHolder
        }
      }
    ''');

      if (result.hasException) {
        emit(AccountsErrorState(result.exception.toString()));
      } else {
        final accountsData = result.data!['accounts'];
        if (accountsData != null) {
          List<Account> newaccount = accountMapFrom(result.data!['accounts']);
          emit(AccountsLoadedState(accountsData, newaccount));
        } else {
          emit(AccountsErrorState('Error getting accounts.'));
        }
      }
    } catch (e) {
      emit(AccountsErrorState(e.toString()));
    }
  }
}
