import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_and_morty_app/http/clients/api_client.dart';
import 'package:rick_and_morty_app/http/clients/local_client.dart';
import 'package:rick_and_morty_app/system/bloc/characters_cubit.dart';
import 'package:rick_and_morty_app/system/device/network_check.dart';
import 'package:rick_and_morty_app/system/use_cases/paginated_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'data/repostories/character_repository.dart';
import 'main.dart';

Future<void> init() async {
  locatorService.registerFactory<CharactersCubit>(
        () => CharactersCubit(
      loader: locatorService(),
    ),
  );
  locatorService.registerLazySingleton<PaginatedLoader>(
        () => PaginatedLoader(repository: locatorService()),
  );
  locatorService.registerLazySingleton<CharacterRepository>(
        () => CharacterRepositoryImpl(
      apiClient: locatorService(),
      localClient: locatorService(),
      networkInfo: locatorService(),
    ),
  );
  locatorService.registerLazySingleton<ApiClient>(
        () => ApiClientImpl(
      client: locatorService(),
    ),
  );
  locatorService.registerLazySingleton<LocalClient>(
        () => LocalClientImpl(sharedPreferences: locatorService()),
  );
  locatorService.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(internetConnectionChecker: locatorService()),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  locatorService.registerLazySingleton(() => sharedPreferences);
  locatorService.registerLazySingleton(() => GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink('https://rickandmortyapi.com/graphql')));
  locatorService.registerLazySingleton(
        () => InternetConnectionChecker(),
  );



}
