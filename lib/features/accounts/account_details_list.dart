import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountDetailsListPage extends StatefulWidget {
  const AccountDetailsListPage({super.key, required this.accounts});
  final List<Account> accounts;

  @override
  State<AccountDetailsListPage> createState() => _AccountDetailsListPageState();
}

class _AccountDetailsListPageState extends State<AccountDetailsListPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
          itemCount: widget.accounts.length,
          itemBuilder: (context, index) {
            Account account = widget.accounts[index];
            return accountWidget(
                index: index, account: account, accountsList: widget.accounts);
          }),
    );
  }

  Widget accountWidget(
      {required int index,
      required Account account,
      required List<Account> accountsList}) {
    return GestureDetector(
      onTap: () {
        context.push('/accountdetails',
            extra: {"account": account, "accountlist": accountsList});
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16, top: index == 0 ? 16 : 0),
        clipBehavior: Clip.hardEdge,
        color: AppColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(
              width: 1,
              color: AppColors.white,
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
                    Text(account.accountHolder ?? 'NA',
                        maxLines: 2,
                        style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    Text(
                        'A/C: ${account.accountNumber == null ? 'NA' : account.accountNumber.toString()}',
                        style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    Text('Account Type: ${account.accountType ?? 'NA'}',
                        style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Text(
                  '\$ ${account.balance == null ? 'NA' : account.balance!.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: account.balance! < 0.0
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
}
