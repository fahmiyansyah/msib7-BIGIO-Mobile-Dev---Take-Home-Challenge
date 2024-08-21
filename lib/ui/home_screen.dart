import 'package:bigio_test/data/cubits/characters/fetch_characters_cubit.dart';
import 'package:bigio_test/ui/character_detail_screen2.dart';
import 'package:bigio_test/ui/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../data/cubits/characters/fetch_characters_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FetchCharactersCubit>().characters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rick and Mort',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FetchCharactersCubit, FetchCharactersState>(
        builder: (context, state) {
          if (state is FetchCharactersLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Just Wait a Second")
                ],
              ),
            );
          } else if (state is FetchCharactersSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.character.length,
              itemBuilder: (context, index) {
                return GestureDetector(
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
                  child: GridTile(
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 180,
                            width: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FadeInImage(
                                  placeholder: const AssetImage(
                                    "assets/images/fa16514fbec646d08f51e1bd5fdc6ab5.gif",
                                  ),
                                  image: NetworkImage(
                                      state.character[index].image),
                                  fadeOutDuration:
                                      const Duration(milliseconds: 700),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(state.character[index].name,
                              style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is FetchCharactersFailure) {
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
