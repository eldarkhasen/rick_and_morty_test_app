import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/data/entities/character.dart';
import 'package:rick_and_morty_app/data/repostories/character_repository.dart';
import 'package:rick_and_morty_app/system/exceptions/failure.dart';
import 'package:rick_and_morty_app/system/use_cases/use_cases.dart';


class PaginatedLoader extends UseCase<List<CharacterEntity>, PageCharacterParams> {
  final CharacterRepository repository;

  PaginatedLoader({required this.repository});

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(PageCharacterParams params) async{
    return await repository.loadAllCharacters(params.page);
  }

}
class PageCharacterParams extends Equatable {
  final int page;

  const PageCharacterParams({required this.page});

  @override
  List<Object> get props => [page];
}

