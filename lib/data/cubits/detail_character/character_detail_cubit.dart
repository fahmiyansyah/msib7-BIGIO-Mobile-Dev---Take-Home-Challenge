import '../../repositories/characters_repository.dart';
import 'package:bloc/bloc.dart';

import 'character_detail_state.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  CharacterDetailCubit() : super(CharacterDetailInitial());
  final CharactersRepository _characterRepository = CharactersRepository();

  Future<void> detailCharacter(int charId) async {
    emit(CharacterDetailLoading());
    try {
      final response = await _characterRepository.getChar(id: charId);

      final characterData = response.data;

      emit(CharacterDetailSuccess(characterData));
    } catch (error) {
      emit(CharacterDetailFailure(error.toString()));
    }
  }
}
