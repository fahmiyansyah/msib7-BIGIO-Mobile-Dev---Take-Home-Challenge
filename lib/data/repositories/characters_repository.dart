import 'package:bigio_test/api/api.dart';
import 'package:bigio_test/data/models/character.dart';

class CharactersRepository {
  final ApiProvider _provider = ApiProvider();

  Future<CharacterGeneralResponse> fetchAllChar() async {
    final response = await _provider.get('/character/');
    int pages = (response['info']['pages'] ?? 1);

    List<CharactersData> allCharacters = [];

    for (int i = 1; i <= pages; i++) {
      final responsePage = await _provider.get('/character/?page=$i');
      allCharacters.addAll(responsePage['results']
          .map<CharactersData>((item) => CharactersData.fromJson(item)));
    }

    return CharacterGeneralResponse(
      info: Info.fromJson(response['info']),
      results: allCharacters,
    );
  }

  Future<CharacterDetailResponse> getChar({required int id}) async {
    final response = await _provider.get('/character/$id');

    if (response != null) {
      return CharacterDetailResponse.fromJson(response);
    } else {
      throw Exception('Failed to load characters data');
    }
  }

  Future<CharacterGeneralResponse> searchCharacters(
      {required String name}) async {
    final response = await _provider.get('/character/?name=$name');

    if (response != null) {
      return CharacterGeneralResponse.fromJson(response);
    } else {
      throw Exception('Failed to load characters data');
    }
  }
}
