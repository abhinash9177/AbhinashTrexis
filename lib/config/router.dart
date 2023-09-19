import 'package:abhinash_trexis/config/route_names.dart';
import 'package:abhinash_trexis/features/accounts/account_details.dart';
import 'package:abhinash_trexis/features/authentication/loginpage.dart';
import 'package:abhinash_trexis/features/dashboard/dashboard.dart';
import 'package:abhinash_trexis/features/services/contacts.dart';
import 'package:abhinash_trexis/features/services/statements_list.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  //urlPathStrategy: UrlPathStrategy.path,
  // redirect: (state) {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     return '/login';
  //   } else {
  //     return null;
  //   }
  // },
  routes: <GoRoute>[
    // GoRoute(
    //   path: '/',
    //   redirect: (_) => '/login',
    // ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: '/${RouteName.login}',
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    // GoRoute(
    //   path: '/:page',
    //   builder: (BuildContext context, GoRouterState state) => DashboardPage(
    //     tab: state.pathParameters['page']!,
    //   ),
    // ),
    GoRoute(
      path: '/${RouteName.home}',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage<void>(
        key: state.pageKey,
        child: const DashboardPage(
          tab: RouteName.home,
        ),
      ),
    ),
    GoRoute(
      path: '/${RouteName.accounts}',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage<void>(
        key: state.pageKey,
        child: const DashboardPage(
          tab: RouteName.accounts,
        ),
      ),
    ),
    GoRoute(
      path: '/${RouteName.services}',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage<void>(
        key: state.pageKey,
        child: const DashboardPage(
          tab: RouteName.services,
        ),
      ),
    ),

    GoRoute(
        path: '/accountdetails',
        pageBuilder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: AccountDetailsPage(
              account: args['account'] as Account,
              accountsList: args['accountlist'] as List<Account>,
            ),
          );
        }),

    GoRoute(
      path: '/${RouteName.statements}',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage<void>(
        key: state.pageKey,
        child: const StatementsPage(),
      ),
    ),
    GoRoute(
      path: '/${RouteName.contacts}',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage<void>(
        key: state.pageKey,
        child: const ContactsPage(),
      ),
    ),
  ],
);
