import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:flutter/material.dart';

class AccountNumberShowPage extends StatefulWidget {
  const AccountNumberShowPage({super.key, required this.account});
  final Account account;

  @override
  State<AccountNumberShowPage> createState() => _AccountNumberShowPageState();
}

class _AccountNumberShowPageState extends State<AccountNumberShowPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: AppColors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(width: 1, color: AppColors.primary)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'A/C: ${widget.account.accountNumber == null ? 'NA' : widget.account.accountNumber.toString()}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
            Text(
                '\$ ${widget.account.balance == null ? 'NA' : widget.account.balance!.toStringAsFixed(2)}',
                style: TextStyle(
                    color: widget.account.balance! < 0.0
                        ? AppColors.red
                        : AppColors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
