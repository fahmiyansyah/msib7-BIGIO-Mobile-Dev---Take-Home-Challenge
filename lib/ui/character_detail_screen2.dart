import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/cubits/characters/fetch_characters_cubit.dart';
import '../data/cubits/characters/fetch_characters_state.dart';
import 'package:url_launcher/url_launcher.dart';

class CharacterDetail2Screen extends StatefulWidget {
  final int characterId;

  const CharacterDetail2Screen({required this.characterId, super.key});

  @override
  State<CharacterDetail2Screen> createState() => _CharacterDetail2ScreenState();
}

class _CharacterDetail2ScreenState extends State<CharacterDetail2Screen> {
  @override
  Widget build(BuildContext context) {
    bool _isOriginPressed = false;
    bool _isLocationPressed = false;
    bool _isEpisodePressed = false;
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
                            Row(
                              children: [
                                const Text(
                                  'Origin: ',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 144, 95, 228),
                                  ),
                                ),
                                InkWell(
                                  onTapDown: (details) {
                                    setState(() {
                                      _isOriginPressed = true;
                                    });
                                  },
                                  onTapUp: (details) {
                                    setState(() {
                                      _isOriginPressed = false;
                                    });
                                  },
                                  onTap: () async {
                                    final url = character.origin.url;
                                    if (await canLaunchUrl(Uri.parse(url))) {
                                      await launchUrl(Uri.parse(url));
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Text(
                                    character.origin.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: _isOriginPressed
                                          ? Colors.blue.withOpacity(0.5)
                                          : Colors.blue,
                                      decoration: _isOriginPressed
                                          ? TextDecoration.underline
                                          : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text(
                                  'Location: ',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 144, 95, 228),
                                  ),
                                ),
                                InkWell(
                                  onTapDown: (details) {
                                    setState(() {
                                      _isLocationPressed = true;
                                    });
                                  },
                                  onTapUp: (details) {
                                    setState(() {
                                      _isLocationPressed = false;
                                    });
                                  },
                                  onTap: () async {
                                    final url = character.location.url;
                                    if (await canLaunchUrl(Uri.parse(url))) {
                                      await launchUrl(Uri.parse(url));
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Text(
                                    character.location.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: _isOriginPressed
                                          ? Colors.blue.withOpacity(0.5)
                                          : Colors.blue,
                                      decoration: _isOriginPressed
                                          ? TextDecoration.underline
                                          : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            InkWell(
                              onTapDown: (details) {
                                setState(() {
                                  _isEpisodePressed = true;
                                });
                              },
                              onTapUp: (details) {
                                setState(() {
                                  _isEpisodePressed = false;
                                });
                              },
                              onTap: () async {
                                for (var episodeUrl in character.episode) {
                                  if (await canLaunchUrl(
                                      Uri.parse(episodeUrl))) {
                                    await launchUrl(Uri.parse(episodeUrl));
                                  } else {
                                    throw 'Could not launch $episodeUrl';
                                  }
                                }
                              },
                              child: Text(
                                character.episode
                                    .map((episodeUrl) =>
                                        'Episode ${episodeUrl.split('/').last}')
                                    .join(', '),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: _isEpisodePressed
                                      ? Colors.blue.withOpacity(0.5)
                                      : Colors.blue,
                                  decoration: _isEpisodePressed
                                      ? TextDecoration.underline
                                      : null,
                                ),
                              ),
                            ),
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
}
