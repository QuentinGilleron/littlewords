import 'package:flutter/material.dart';
import 'package:littlewords/beans/dto/word.dto.dart';


class WordCard extends StatelessWidget {
  const WordCard({Key? key, required this.word}) : super(key: key);

  final WordDTO word;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  // On met un titre en gris : Gestion du mot # + l'id du mot
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey[200],

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // de taille 15 le texte
                              Text(
                                "Gestion du mot #" + word.uid!.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            // Bouton supprimer
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO : Supprimer le mot
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: Text("Supprimer"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO : Relacher le mot
                              },
                              child: Text("Relacher"),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                );
              });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(word.author!),
                    Spacer(),
                    Text("#" + word.uid!.toString(), style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Text(word.content!), // On affiche le contenu du mot.
              ],
            ),
          ),
        ),
      ),
    );
  }

}
