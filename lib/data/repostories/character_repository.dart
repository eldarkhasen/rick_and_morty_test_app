import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/data/entities/character.dart';
import 'package:rick_and_morty_app/http/clients/api_client.dart';
import 'package:rick_and_morty_app/http/clients/local_client.dart';
import 'package:rick_and_morty_app/system/device/network_check.dart';
import 'package:rick_and_morty_app/system/exceptions/failure.dart';

import '../../system/exceptions/exception.dart';
abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> loadAllCharacters(int page);
}
class CharacterRepositoryImpl implements CharacterRepository {
  final ApiClient apiClient;
  final LocalClient localClient;
  final NetworkInfo networkInfo;

  CharacterRepositoryImpl(
      {required this.apiClient,
      required this.localClient,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<CharacterEntity>>> loadAllCharacters(
      int page) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getCharacters(page);
        localClient.charactersToCache(response);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final response = await localClient.getCharacterFromCache();
        return Right(response);
      } on LocalCacheException {
        return Left(CacheFailure());
      }
    }
  }
}
