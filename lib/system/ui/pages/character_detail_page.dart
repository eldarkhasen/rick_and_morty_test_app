import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/entities/character.dart';
import 'package:rick_and_morty_app/system/ui/widgets/small_circle_image.dart';

import '../widgets/large_circle_image.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailsPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character info"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LargeCircleImage(imageUrl: character.image),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        character.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        character.status,
                        style: TextStyle(
                            color: character.status == 'Alive'
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Information:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Gender: " + character.gender),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Type: " + character.type),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Origin: " + character.origin.name),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Location: " + character.location.name),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Species: " + character.species)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
