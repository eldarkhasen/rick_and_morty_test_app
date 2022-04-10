import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/system/ui/pages/characters_list.dart';

final ScrollController scrollController = ScrollController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and morty app'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 5, right: 5),
        child: CharactersList(),
      ),
    );
  }
}
