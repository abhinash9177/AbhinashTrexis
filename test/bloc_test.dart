import 'package:abhinash_trexis/bloc/accounts/accounts_bloc.dart';
import 'package:abhinash_trexis/bloc/accounts/accounts_state.dart';
import 'package:abhinash_trexis/bloc/home/home_bloc.dart';
import 'package:abhinash_trexis/bloc/home/home_state.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:abhinash_trexis/network/call_api.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';

final List<dynamic> accounts = [];
final List<Account> newAccounts = [];

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  group('Bloc Testing', () {
    late GraphQLRepository repository;

    GraphQLClient client = GraphQLClient(
      link: HttpLink('http://localhost:4000/'),
      cache: GraphQLCache(store: InMemoryStore()),
    );

    setUp(() {
      repository = GraphQLRepository(client);
    });

    blocTest<AccountsBloc, AccountsState>(
      'emits AccountsLoadingState and AccountsLoadedState when function called',
      build: () => AccountsBloc(repository),
      act: (cubit) => cubit.getAccountDetails(),
      expect: () => [isA<AccountsLoadingState>(), isA<AccountsLoadedState>()],
    );

    blocTest<HomeBloc, HomeState>(
      'emits HomeLoadingState and HomeLoadedState when function called',
      build: () => HomeBloc(repository),
      act: (cubit) => cubit.getHometDetails(),
      expect: () => [isA<HomeLoadingState>(), isA<HomeLoadedState>()],
    );
  });
}
