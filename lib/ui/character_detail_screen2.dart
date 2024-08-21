import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/cubits/characters/fetch_characters_cubit.dart';
import '../data/cubits/characters/fetch_characters_state.dart';

class CharacterDetail2Screen extends StatefulWidget {
  final int characterId;

  const CharacterDetail2Screen({required this.characterId, super.key});

  @override
  State<CharacterDetail2Screen> createState() => _CharacterDetail2ScreenState();
}

class _CharacterDetail2ScreenState extends State<CharacterDetail2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 44, 22, 82),
        child: BlocBuilder<FetchCharactersCubit, FetchCharactersState>(
          builder: (context, state) {
            if (state is FetchCharactersSuccess) {
              final character = state.character
                  .firstWhere((element) => element.id == widget.characterId);
              return Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 350,
                        width: double.maxFinite,
                        child: Image(
                          image: NetworkImage(character.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 50,
                          child: Center(
                            child: Text(
                              character.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Species: ',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 107, 60, 188),
                                    ),
                                  ),
                                  Text(
                                    character.species,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                cardData('Status: ', character.status),
                                cardData('Type: ', character.type),
                                cardData('Gender: ', character.gender),
                              ],
                            ),
                            const SizedBox(height: 8),
                            text('Origin: ', character.origin.name),
                            const SizedBox(height: 3),
                            text('Location: ', character.location.name),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                'Episode: ',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 144, 95, 228),
                                ),
                              ),
                            ),
                            Center(
                              child: InkWell(
                                child: Wrap(
                                  spacing: 15,
                                  children: character.episode.map((episodeUrl) {
                                    return SizedBox(
                                      height: 40,
                                      width: 110,
                                      child: Card(
                                        color:
                                            Colors.white.withOpacity(0.2),
                                        child: Center(
                                          child: Text(
                                            'Episode ${episodeUrl.split('/').last}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue,
                                              decoration: TextDecoration
                                                  .underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget cardData(String headText, String data) {
    return Expanded(
      child: Card(
        color: Colors.white.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              headText,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 107, 60, 188),
              ),
            ),
            Text(
              data,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget text(String headText, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          headText,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 144, 95, 228),
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
