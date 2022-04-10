import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/entities/character.dart';
import 'package:rick_and_morty_app/system/ui/widgets/small_circle_image.dart';

class CharacterTile extends StatelessWidget {
  final CharacterEntity character;

  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Material(
        elevation: 0,
        child: InkWell(
          onTap: () {},
          child: Ink(
            child: ListTile(
              leading: Builder(
                builder: (BuildContext context) {
                  return SmallCircleImage(imageUrl: character.image);
                },
              ),
              title: Text(
                character.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                character.gender,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
