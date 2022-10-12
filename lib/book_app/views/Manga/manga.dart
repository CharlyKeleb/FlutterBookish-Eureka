import 'package:flutter/material.dart';

class Manga extends StatefulWidget {
  const Manga({Key? key}) : super(key: key);

  @override
  State<Manga> createState() => _MangaState();
}

class _MangaState extends State<Manga> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width - 20,
          color: Colors.yellow,
        )
      ],
    );
  }
}
