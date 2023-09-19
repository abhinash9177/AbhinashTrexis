import 'package:abhinash_trexis/bloc/accounts/accounts_bloc.dart';
import 'package:abhinash_trexis/bloc/accounts/accounts_state.dart';
import 'package:abhinash_trexis/features/accounts/accounts_list.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:abhinash_trexis/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AccountsBloc>(context).getAccountDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   title: const Text('GraphQL Bloc Example'),
      // ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<AccountsBloc, AccountsState>(
          builder: (context, state) {
            if (state is AccountsInitialState ||
                state is AccountsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountsErrorState) {
              return Center(child: errorWidget('Error getting Accounts.'));
            } else if (state is AccountsLoadedState) {
              List<Account> accounts = state.newAccounts;

              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Accounts',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: accountList(accounts)),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Unknown State'));
            }
          },
        ),
      ),
    ));
  }

  Widget accountList(List<Account> acounts) =>
      AccountsListPage(accounts: acounts);
}
