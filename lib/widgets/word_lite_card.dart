import 'package:flutter/material.dart';

import '../beans/dto/word.dto.dart';

class WordLiteCard extends StatelessWidget {
  const WordLiteCard({Key? key, required this.word}) : super(key: key);

  final WordDTO word;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],

      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("#" + word.uid!.toString()),
            // On affiche le contenu du mot.
          ],
        ),
      ),
    );
  }
}
