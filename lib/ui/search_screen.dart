import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bigio_test/data/cubits/characters/fetch_characters_cubit.dart';
import 'package:bigio_test/ui/character_detail_screen2.dart';

import '../data/cubits/characters/fetch_characters_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Characters'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          BlocBuilder<FetchCharactersCubit, FetchCharactersState>(
            builder: (context, state) {
              if (state is FetchCharactersLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchCharactersSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.character.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(state.character[index].image),
                          title: Text(state.character[index].name),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetail2Screen(
                                  characterId: state.character[index].id,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('No characters found'),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<FetchCharactersCubit>()
              .searchCharacters(_searchController.text);
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
