import 'package:equatable/equatable.dart';

import '../../data/entities/character.dart';

abstract class CharactersState extends Equatable{
  const CharactersState();
  @override
  List<Object> get props => [];
}

class CharactersInitial extends CharactersState{}

class CharactersListLoading extends CharactersState {
  final List<CharacterEntity> oldCharacterList;
  final bool isFirstFetch;

  CharactersListLoading(this.oldCharacterList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldCharacterList];
}

class CharactersListLoaded extends CharactersState {
  final List<CharacterEntity> characterList;

  CharactersListLoaded(this.characterList);

  @override
  List<Object> get props => [characterList];
}

class CharactersListError extends CharactersState {
  final String errorMessage;

  CharactersListError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}