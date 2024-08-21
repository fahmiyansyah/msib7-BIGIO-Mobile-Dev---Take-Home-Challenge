import 'package:bigio_test/ui/character_detail_screen2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/provider/favorite_characters_provider.dart';

class FavoriteCharactersScreen extends StatefulWidget {
  const FavoriteCharactersScreen({super.key});

  @override
  _FavoriteCharactersScreenState createState() =>
      _FavoriteCharactersScreenState();
}

class _FavoriteCharactersScreenState extends State<FavoriteCharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Characters',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<FavoriteCharactersProvider>(
        builder: (context, provider, child) {
          if (provider.favoriteCharacters.isEmpty) {
            return const Center(
              child: Text('No favorite characters yet.'),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: provider.favoriteCharacters.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDetail2Screen(
                          characterId: provider.favoriteCharacters[index].id,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 170,
                          width: 190,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                                placeholder: const AssetImage(
                                  "assets/images/fa16514fbec646d08f51e1bd5fdc6ab5.gif",
                                ),
                                image: NetworkImage(
                                    provider.favoriteCharacters[index].image),
                                fadeOutDuration:
                                    const Duration(milliseconds: 700),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Text(
                          provider.favoriteCharacters[index].name,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
