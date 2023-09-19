import 'package:abhinash_trexis/bloc/transactions/transactions_bloc.dart';
import 'package:abhinash_trexis/bloc/transactions/transactions_state.dart';
import 'package:abhinash_trexis/features/accounts/transactions.dart';

import 'package:abhinash_trexis/model/transaction_model.dart';
import 'package:abhinash_trexis/widgets/error.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TransactionsBloc>(context).getTransactionstDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      child: BlocBuilder<TransactionsBloc, TransactionsState>(
        builder: (context, state) {
          if (state is TransactionsInitialState ||
              state is TransactionsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TransactionsErrorState) {
            return Center(child: errorWidget('Error getting Transactions.'));
          } else if (state is TransactionsLoadedState) {
            List<Transaction> transactions = state.transactions!;

            return transactionsListMethod(transactions);
          } else {
            return const Center(child: Text('Unknown State'));
          }
        },
      ),
    );
  }

  Widget transactionsListMethod(List<Transaction> transactions) =>
      TransactionsShowPage(transactions: transactions);
}
