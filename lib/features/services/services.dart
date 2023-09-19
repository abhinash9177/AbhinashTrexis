import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/config/route_names.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  addHeight(24),
                  const Text(
                    'Services',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  addHeight(16),
                  aserviceWidget(title: 'Loan'),
                  aserviceWidget(title: 'Statements'),
                  aserviceWidget(title: 'Contacts'),
                ],
              ),
            )),
      ),
    );
  }

  Widget aserviceWidget({
    required String title,
  }) {
    return GestureDetector(
      onTap: () {
        onTapFunction(title);
        // context.push('/accountdetails',
        //     extra: {"account": account, "accountlist": accountsList});
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.text,
              )
            ],
          ),
        ),
      ),
    );
  }

  onTapFunction(String text) {
    if (text == 'Loan') {
      showSnackbar();
    } else if (text == 'Statements') {
      context.push('/${RouteName.statements}');
    } else {
      context.push('/${RouteName.contacts}');
    }
  }

  showSnackbar() {
    const snackBar = SnackBar(
      content: Text('Error while getting loans!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
