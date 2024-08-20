import 'dart:convert';
import 'dart:io';

import 'package:bigio_test/api/api.dart';
import 'package:bigio_test/data/models/character.dart';
import 'package:bigio_test/utils/constants.dart' as AppConst;

class CharacterRepository {
  final ApiProvider _provider = ApiProvider();

  Future<CharacterGeneralResponse> fetchAllChar() async {
    final response = await _provider.get('/character', headers: {});

    Map<String, dynamic> data = {"data": response};

    return CharacterGeneralResponse.fromJson(data);
  }

  Future<CharacterGeneralResponse> getChar() async {
    final response = await _provider.get('/character/2', headers: {
      HttpHeaders.contentTypeHeader: 'text/plain',
    });

    return CharacterGeneralResponse.fromJson(response);
  }
}
