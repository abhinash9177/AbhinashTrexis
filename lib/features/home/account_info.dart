import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/model/home_model.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:flutter/material.dart';

class MyAccountInfo extends StatefulWidget {
  const MyAccountInfo({super.key, required this.home});
  final Home home;

  @override
  State<MyAccountInfo> createState() => _MyAccountInfoState();
}

class _MyAccountInfoState extends State<MyAccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: AppColors.primarylight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Account Number',
                style: TextStyle(
                    color: AppColors.lable,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            Text(
                widget.home.accountNumber == null
                    ? 'NA'
                    : widget.home.accountNumber.toString(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            addHeight(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: AppColors.primary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Text(
                          'Balence : ${widget.home.balance == null ? 'NA' : widget.home.balance.toString()}',
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    )),
                Text('Currency: ${widget.home.currency ?? 'NA'}',
                    style: const TextStyle(
                        color: AppColors.lable,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
