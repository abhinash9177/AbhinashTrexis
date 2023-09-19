import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/features/accounts/account_details_list.dart';
import 'package:abhinash_trexis/features/accounts/show_account_number.dart';
import 'package:abhinash_trexis/features/accounts/transactions_list.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage(
      {super.key, required this.account, required this.accountsList});
  final Account account;
  final List<Account> accountsList;

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  String selectedTab = 'Transactions';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addHeight(24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: AppColors.black,
                      size: 20,
                    ),
                  ),
                  addWidth(16),
                  const Text(
                    'Accounts Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              addHeight(16),
              accountNoShow(widget.account),
              addHeight(16),

              //Tabs
              accountDetailsTabs(),
              Expanded(child: showTabsPages())
            ],
          ),
        ),
      ),
    ));
  }

//Account Number display
  Widget accountNoShow(Account account) => AccountNumberShowPage(
        account: account,
      );
  Widget showTabsPages() {
    return selectedTab == 'Transactions'
        ? const TransactionsPage()
        : AccountDetailsListPage(
            accounts: widget.accountsList,
          );
  }

  // tabs
  Widget accountDetailsTabs() {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xffffffff)),
      child: Row(
        children: [
          buttonTab('Transactions'),
          addWidth(10),
          buttonTab('Details'),
        ],
      ),
    );
  }

  Widget buttonTab(String text) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = text;
          });
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: selectedTab == text ? AppColors.primary : AppColors.white),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: selectedTab == text
                      ? AppColors.white
                      : AppColors.textlight,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ));
  }
}
