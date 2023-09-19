import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountsListPage extends StatefulWidget {
  const AccountsListPage({super.key, required this.accounts});
  final List<Account> accounts;

  @override
  State<AccountsListPage> createState() => _AccountsListPageState();
}

class _AccountsListPageState extends State<AccountsListPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: widget.accounts.isEmpty
          ? const Center(
              child: Text('No Accounts Found!',
                  style: TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            )
          : ListView.builder(
              itemCount: widget.accounts.length,
              itemBuilder: (context, index) {
                Account account = widget.accounts[index];
                return accountWidget(
                    index: index,
                    account: account,
                    accountsList: widget.accounts);
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
        margin: const EdgeInsets.only(bottom: 16),
        clipBehavior: Clip.hardEdge,
        color: AppColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(
              width: 1,
              color: AppColors.primary,
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(account.accountHolder ?? 'NA',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              Text('Account Type: ${account.accountType ?? 'NA'}',
                  style: const TextStyle(
                      color: AppColors.lable,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
