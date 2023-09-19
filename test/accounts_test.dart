import 'package:abhinash_trexis/network/call_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:abhinash_trexis/model/account_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  group('Accounts', () {
    GraphQLClient client = GraphQLClient(
      link: HttpLink('http://localhost:4000/'),
      cache: GraphQLCache(store: InMemoryStore()),
    );
    late GraphQLRepository repository;
    setUp(() {
      repository = GraphQLRepository(client);
    });

    test('getAccounts returns a list of accounts', () async {
      String query = r'''
        query getAccounts {
          accounts {
            id
            accountNumber
            accountType
            balance
            accountHolder
          }
        }
      ''';

      final accounts = await repository.fetchFromApi(query);
      final List<Account> accountsData =
          accountMapFrom(accounts.data!['accounts']);
      expect(accountsData, isA<List<Account>>());
    });
  });
}
