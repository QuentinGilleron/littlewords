import 'package:flutter/material.dart';


class WordCard extends StatelessWidget {
  const WordCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text("Tom"),
                Spacer(),
                Text("#109876"),
              ],
            ),
        Text('Contenu du petit mot que j\'ai récupéré sur la carte. Et qui est dans mon sac à outils mystère.'),
        ],
        ),
      ),
    );
  }
}
