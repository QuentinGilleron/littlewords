import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../beans/dto/word.dto.dart';
import '../../db/db.helper.dart';
import '../../widgets/word_card.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: DbHelper.findAll(),
            builder: (context, snapshot){
              if (!snapshot.hasData){
                return const CircularProgressIndicator();
              }

              final List<WordDTO>? data = snapshot.data;
              if(data == null){
                return const Text('Auncun mot ramassé');
              }
              // On retourne une Liste de WordCard
              return ListView.builder(
                itemCount: data.length,
                  itemBuilder: (context, index){
                    WordDTO word = data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WordCard(word: word),
                    );
                  }
              );
            }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                WordDTO wordDTO = WordDTO(null, 'author', 'content', 1, 2);
                DbHelper.insert(wordDTO);
            },
    ),
    );
  }
}
