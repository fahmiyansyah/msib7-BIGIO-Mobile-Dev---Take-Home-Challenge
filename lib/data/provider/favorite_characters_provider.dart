import 'package:flutter/material.dart';
import '../models/character.dart';

class FavoriteCharactersProvider with ChangeNotifier {
  List<CharactersData> _favoriteCharacters = [];

  List<CharactersData> get favoriteCharacters => _favoriteCharacters;

  void addFavoriteCharacter(CharactersData character) {
    _favoriteCharacters.add(character);
    notifyListeners();
  }

  void removeFavoriteCharacter(CharactersData character) {
    _favoriteCharacters.removeWhere((element) => element.id == character.id);
    notifyListeners();
  }
}
