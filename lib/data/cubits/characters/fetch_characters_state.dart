import 'package:bigio_test/data/models/character.dart';
import 'package:equatable/equatable.dart';

abstract class FetchCharactersState extends Equatable {
  const FetchCharactersState();

  @override
  List<Object> get props => [];
}

class FetchCharactersInitial extends FetchCharactersState {}

class FetchCharactersLoading extends FetchCharactersState {}

class FetchCharactersSuccess extends FetchCharactersState {
  const FetchCharactersSuccess(this.character);

  final List<CharactersData> character;

  @override
  List<Object> get props => [character];
}

class FetchCharactersLoaded extends FetchCharactersState {
  const FetchCharactersLoaded(this.character);
  final List<CharactersData> character;

  @override
  List<Object> get props => [character];
}

class FetchCharactersFailure extends FetchCharactersState {
  final String message;

  const FetchCharactersFailure(this.message);

  @override
  List<Object> get props => [message];
}

class FetchCharactersEmpty extends FetchCharactersState {}
