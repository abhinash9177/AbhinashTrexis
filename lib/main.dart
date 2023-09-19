import 'package:abhinash_trexis/bloc/accounts/accounts_bloc.dart';
import 'package:abhinash_trexis/bloc/contacts/contacts_bloc.dart';
import 'package:abhinash_trexis/bloc/home/home_bloc.dart';
import 'package:abhinash_trexis/bloc/statements/statements_bloc.dart';
import 'package:abhinash_trexis/bloc/transactions/transactions_bloc.dart';
import 'package:abhinash_trexis/config/base_url.dart';
import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/config/router.dart';
import 'package:abhinash_trexis/network/call_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: HttpLink(
        Baseurl.url,
      ),
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AccountsBloc(GraphQLRepository(client.value))),
          BlocProvider(
              create: (context) => HomeBloc(GraphQLRepository(client.value))),
          BlocProvider(
              create: (context) =>
                  TransactionsBloc(GraphQLRepository(client.value))),
          BlocProvider(
              create: (context) =>
                  StatementsBloc(GraphQLRepository(client.value))),
          BlocProvider(
              create: (context) =>
                  ContactsBloc(GraphQLRepository(client.value)))
        ],
        child: MaterialApp.router(
            title: 'Abhinash Trexis',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.background,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              fontFamily: 'Inter',
            ),
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate),
      ),
    );
  }
}
