import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/features/dashboard/tabpages.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, this.tab}) : super(key: key);
  final String? tab;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  int navIndex = 0;
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press again to exit app');
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: tabPage(widget.tab!),
        )),
        bottomNavigationBar: Container(
          height: 80,
          color: const Color(0xffFFFFFF),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navBlock(0, Icons.home, 'Home'),
                navBlock(1, Icons.account_balance, 'Accounts'),
                navBlock(2, Icons.miscellaneous_services, 'Services'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navBlock(int index, IconData icon, String name) {
    String routeName = name.toLowerCase();
    return InkWell(
      splashColor: AppColors.primary,
      onTap: () {
        context.go('/$routeName');
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 30,
                child: routeName == widget.tab
                    ? SvgPicture.asset(
                        'assets/svg/${routeName}_filled.svg',
                        height: 30,
                      )
                    : SvgPicture.asset(
                        'assets/svg/${routeName}_outline.svg',
                        height: 30,
                      )),
            // Icon(
            //   icon,
            //   color:
            //       routeName == widget.tab ? AppColors.primary : AppColors.black,
            // ),
            addHeight(4),
            Text(
              name,
              style: TextStyle(
                  fontSize: 12,
                  color: routeName == widget.tab
                      ? AppColors.primary
                      : AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}
