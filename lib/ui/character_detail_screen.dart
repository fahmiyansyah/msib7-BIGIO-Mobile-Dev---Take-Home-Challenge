import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/cubits/detail_character/character_detail_cubit.dart';
import '../data/cubits/detail_character/character_detail_state.dart';

class CharacterDetailScreen extends StatelessWidget {
  final int characterId;

  const CharacterDetailScreen({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    context.read<CharacterDetailCubit>().detailCharacter(characterId);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character Detail"),
      ),
      body: BlocBuilder<CharacterDetailCubit, CharacterDetailState>(
        builder: (context, state) {
          if (state is CharacterDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterDetailSuccess) {
            return Column(
              children: [
                // Image
                Container(
                  height: 200,
                  color: Colors.amber,
                  width: double.infinity,
                  child: Image.network(state.character.image),
                ),
                // Detail
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(state.character.name,
                          style: TextStyle(fontSize: 24)),
                      Text(state.character.gender),
                      Text(state.character.species),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is CharacterDetailFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
