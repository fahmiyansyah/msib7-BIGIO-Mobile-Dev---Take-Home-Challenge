import 'package:bigio_test/data/cubits/characters/fetch_characters_state.dart';
import '../../repositories/characters_repository.dart';
import 'package:bloc/bloc.dart';

class FetchCharactersCubit extends Cubit<FetchCharactersState> {
  FetchCharactersCubit() : super(FetchCharactersInitial());
  final CharactersRepository _characterRepository = CharactersRepository();

  Future<void> characters() async {
    emit(FetchCharactersLoading());
    try {
      final response = await _characterRepository.fetchAllChar();
      emit(FetchCharactersSuccess(response.results));
    } catch (error) {
      emit(FetchCharactersFailure(error.toString()));
    }
  }

  Future<void> searchCharacters(String name) async {
    emit(FetchCharactersLoading());
    try {
      final response = await _characterRepository.searchCharacters(name: name);
      emit(FetchCharactersSuccess(response.results));
    } catch (error) {
      emit(FetchCharactersFailure(error.toString()));
    }
  }
}
