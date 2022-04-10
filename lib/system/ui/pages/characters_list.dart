import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/system/bloc/characters_cubit.dart';
import 'package:rick_and_morty_app/system/bloc/characters_state.dart';
import 'package:rick_and_morty_app/system/ui/widgets/character_tile.dart';
import 'package:rick_and_morty_app/system/ui/widgets/error_message.dart';
import 'package:rick_and_morty_app/system/ui/widgets/loader.dart';

import '../../../data/entities/character.dart';
import '../widgets/circular_loading.dart';
import 'home_page.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({Key? key}) : super(key: key);

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        List<CharacterEntity> characters = [];
        if (state is CharactersListLoading && state.isFirstFetch) {
          print('First fetch');
          return LoadingIndicator();
        } else if (state is CharactersListLoaded) {
          characters = state.characterList;
        } else if (state is CharactersListError) {
          return ErrorMessage(errorMessage: state.errorMessage);
        }else if(state is CharactersListLoading){
          characters = state.oldCharacterList;
        }
        return ListView.builder(
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return index > characters.length
                  ? const CircularLoading(
                      color: Colors.grey,
                      value: null,
                    )
                  : CharacterTile(character: characters[index]);
            },
            itemCount: characters.length);
      },
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<CharactersCubit>().loadCharacters();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
