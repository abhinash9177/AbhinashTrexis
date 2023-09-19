import 'package:abhinash_trexis/config/colors.dart';

import 'package:abhinash_trexis/model/transaction_model.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:abhinash_trexis/widgets/date_show.dart';
import 'package:flutter/material.dart';

class TransactionsShowPage extends StatefulWidget {
  const TransactionsShowPage({super.key, required this.transactions});
  final List<Transaction>? transactions;

  @override
  State<TransactionsShowPage> createState() => _TransactionsShowPageState();
}

class _TransactionsShowPageState extends State<TransactionsShowPage> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions!.isEmpty
        ? const Center(
            child: Text('No Transactions Found!',
                style: TextStyle(
                    color: AppColors.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: widget.transactions!.length,
            itemBuilder: (context, index) {
              Transaction transaction = widget.transactions![index];
              return transactionsCard(index: index, transaction: transaction);
            });
  }

  Widget transactionsCard(
      {required int index, required Transaction transaction}) {
    return Container(
      //width: MediaQuery.of(context).size.width - 80,
      margin: EdgeInsets.only(top: index == 0 ? 16 : 0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction.description ?? 'NA',
                        maxLines: 2,
                        style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    addHeight(8),
                    Row(
                      children: [
                        sendingTransaction(transaction.fromAccount ?? 'NA'),
                        addWidth(4),
                        const Icon(
                          Icons.arrow_right_alt_sharp,
                          color: AppColors.text,
                        ),
                        addWidth(4),
                        sendingTransaction(transaction.toAccount ?? 'NA'),
                      ],
                    ),
                    addHeight(8),
                    dateWidget(transaction.date ?? 'NA'),
                  ],
                ),
              ),
              Text(
                  '\$ ${transaction.amount == null ? 'NA' : transaction.amount!.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: transaction.amount! < 0.0
                          ? AppColors.red
                          : AppColors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  Widget sendingTransaction(String value) {
    return Text(value,
        style: const TextStyle(
            color: AppColors.text, fontSize: 16, fontWeight: FontWeight.w500));
  }
}
