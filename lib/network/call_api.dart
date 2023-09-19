import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLRepository {
  final GraphQLClient client;

  GraphQLRepository(this.client);

  Future<QueryResult> fetchFromApi(String queryString) {
    final query = gql(queryString);

    return client.query(QueryOptions(
      document: query,
    ));
  }
}
