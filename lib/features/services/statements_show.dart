import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/model/statement_model.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:abhinash_trexis/widgets/date_show.dart';
import 'package:flutter/material.dart';

class StatementsShowPage extends StatefulWidget {
  const StatementsShowPage({super.key, required this.statements});
  final List<Statement>? statements;

  @override
  State<StatementsShowPage> createState() => _StatementsShowPageState();
}

class _StatementsShowPageState extends State<StatementsShowPage> {
  @override
  Widget build(BuildContext context) {
    return widget.statements!.isEmpty
        ? const Center(
            child: Text('No Statements Found!',
                style: TextStyle(
                    color: AppColors.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: widget.statements!.length,
            itemBuilder: (context, index) {
              Statement transaction = widget.statements![index];
              return statementsCard(index: index, statement: transaction);
            });
  }

  Widget statementsCard({required int index, required Statement statement}) {
    return Container(
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
                    Text(statement.description ?? 'NA',
                        maxLines: 2,
                        style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    addHeight(8),
                    dateWidget(statement.date ?? 'NA'),
                  ],
                ),
              ),
              Text(
                  '\$ ${statement.amount == null ? 'NA' : statement.amount!.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: statement.amount! < 0.0
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
