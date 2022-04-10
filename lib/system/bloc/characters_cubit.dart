import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/data/entities/character.dart';
import 'package:rick_and_morty_app/system/bloc/characters_state.dart';
import 'package:rick_and_morty_app/system/use_cases/paginated_loader.dart';

import '../exceptions/failure.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final PaginatedLoader loader;

  CharactersCubit({required this.loader}) : super(CharactersInitial());

  int page = 1;

  Future<void> loadCharacters() async {
    final currentState = state;
    List<CharacterEntity> currentCharacterList = [];
    if (currentState is CharactersListLoading) {
      return;
    }
    if (currentState is CharactersListLoaded) {
      currentCharacterList = currentState.characterList;
    }
    emit(CharactersListLoading(currentCharacterList, isFirstFetch: page == 1));
    final responseFromRepository =
        await loader(PageCharacterParams(page: page));
    responseFromRepository.fold(
      (failure) =>
          emit(CharactersListError(errorMessage: reportFailure(failure))),
      (character) {
        page++;
        final characters = (state as CharactersListLoading).oldCharacterList;
        characters.addAll(character);
        emit(
          CharactersListLoaded(characters),
        );
      },
    );
  }
}
