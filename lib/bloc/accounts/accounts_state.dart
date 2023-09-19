// Events
import 'package:abhinash_trexis/model/account_model.dart';

// States
abstract class AccountsState {}

class AccountsInitialState extends AccountsState {}

class AccountsLoadingState extends AccountsState {}

class AccountsLoadedState extends AccountsState {
  final List<dynamic> accounts;
  final List<Account> newAccounts;

  AccountsLoadedState(this.accounts, this.newAccounts);
}

class AccountsErrorState extends AccountsState {
  final String error;

  AccountsErrorState(this.error);
}
