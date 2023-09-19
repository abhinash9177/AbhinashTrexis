import 'package:abhinash_trexis/config/route_names.dart';
import 'package:abhinash_trexis/features/accounts/accounts.dart';
import 'package:abhinash_trexis/features/home/home.dart';
import 'package:abhinash_trexis/features/services/services.dart';
import 'package:flutter/material.dart';

Widget tabPage(String page) {
  switch (page) {
    case RouteName.home:
      return const HomePage();
    case RouteName.accounts:
      return const AccountsPage();
    case RouteName.services:
      return const ServicesPage();
    default:
      return const HomePage();
  }
}
