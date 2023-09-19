import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/model/home_model.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:abhinash_trexis/widgets/date_show.dart';
import 'package:flutter/material.dart';

class UpComingBillsPage extends StatefulWidget {
  const UpComingBillsPage({super.key, this.upcoming});
  final List<RecentTransaction>? upcoming;

  @override
  State<UpComingBillsPage> createState() => _UpComingBillsPageState();
}

class _UpComingBillsPageState extends State<UpComingBillsPage> {
  @override
  Widget build(BuildContext context) {
    return widget.upcoming!.isEmpty
        ? const Center(
            child: Text('No Upcoming Bills Found!',
                style: TextStyle(
                    color: AppColors.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          )
        : SizedBox(
            height: 125,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.upcoming!.length,
                itemBuilder: (context, index) {
                  RecentTransaction upcoming = widget.upcoming![index];
                  return transactionsCard(index: index, upcoming: upcoming);
                }),
          );
  }

  Widget transactionsCard(
      {required int index, required RecentTransaction upcoming}) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: const Color.fromARGB(255, 204, 233, 243),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(
              width: 1,
              color: Color.fromARGB(255, 81, 204, 245),
            )),
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
                    Text(upcoming.description ?? 'NA',
                        style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    addHeight(8),
                    Row(
                      children: [
                        sendingTransaction(upcoming.fromAccount ?? 'NA'),
                        addWidth(4),
                        const Icon(
                          Icons.arrow_right_alt_sharp,
                          color: AppColors.text,
                        ),
                        addWidth(4),
                        sendingTransaction(upcoming.toAccount ?? 'NA'),
                      ],
                    ),
                    addHeight(8),
                    dateWidget(upcoming.date ?? 'NA'),
                  ],
                ),
              ),
              Text(
                  '\$ ${upcoming.amount == null ? 'NA' : upcoming.amount!.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: upcoming.amount! < 0.0
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
