import 'package:bigio_test/data/models/character.dart';
import 'package:equatable/equatable.dart';

abstract class CharacterDetailState extends Equatable {
  const CharacterDetailState();

  @override
  List<Object> get props => [];
}

class CharacterDetailInitial extends CharacterDetailState {}

class CharacterDetailLoading extends CharacterDetailState {}

class CharacterDetailSuccess extends CharacterDetailState {
  const CharacterDetailSuccess(this.character);

  final CharactersData character;

  @override
  List<Object> get props => [character];
}

class CharacterDetailLoaded extends CharacterDetailState {
  const CharacterDetailLoaded(this.character);
  final CharactersData character;

  @override
  List<Object> get props => [character];
}

class CharacterDetailFailure extends CharacterDetailState {
  final String message;

  const CharacterDetailFailure(this.message);

  @override
  List<Object> get props => [message];
}

class CharacterDetailEmpty extends CharacterDetailState {}
