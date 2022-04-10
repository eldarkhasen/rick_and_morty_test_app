import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/data/entities/character.dart';
import 'package:rick_and_morty_app/http/helpers/gql_query.dart';
import 'package:rick_and_morty_app/system/exceptions/exception.dart' as exc;

abstract class ApiClient{
  Future<List<CharacterEntity>> getCharacters(int page);
}
class ApiClientImpl implements ApiClient{
  final GraphQLClient client;

  ApiClientImpl({required this.client});

  Future<List<CharacterEntity>> getCharacters(int page) async {
    try {
      final QueryResult result = await client.query(QueryOptions(
          document: gql(GqlQuery.charactersQuery), variables: {"page": page}));
      if (result.data == null) {
        return [];
      }
      print("Settings query:"+ page.toString());
      return result.data?['characters']['results']
          .map((e) => CharacterEntity.fromJson(e))
          .cast<CharacterEntity>()
          .toList();
    } on Exception catch (exception) {
      print(exception);
      throw exc.ServerException();
    }
  }
}
