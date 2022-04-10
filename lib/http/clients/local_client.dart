import 'dart:convert';

import 'package:rick_and_morty_app/data/entities/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../system/exceptions/exception.dart';

const String cachedCharactersList = "characters";


abstract class LocalClient{
  Future<List<CharacterEntity>> getCharacterFromCache();

  Future<void> charactersToCache(List<CharacterEntity> characters);
}
class LocalClientImpl implements LocalClient{
  final SharedPreferences sharedPreferences;

  LocalClientImpl({required this.sharedPreferences});

  Future<List<CharacterEntity>> getCharacterFromCache() {
    final characterListJson =
        sharedPreferences.getStringList(cachedCharactersList);
    if (characterListJson!.isNotEmpty) {
      return Future.value(characterListJson
          .map((character) => CharacterEntity.fromJson(json.decode(character)))
          .toList());
    } else {
      throw LocalCacheException();
    }
  }

  @override
  Future<void> charactersToCache(List<CharacterEntity> characters) {
    final List<String> charactersListJson =
        characters.map((character) => json.encode(character.toJson())).toList();

    sharedPreferences.setStringList(cachedCharactersList, charactersListJson);
    return Future.value(charactersListJson);
  }
}
