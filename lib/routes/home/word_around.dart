import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/beans/dto/one_word.dto.dart';
import 'package:littlewords/beans/dto/word.dto.dart';
import 'package:littlewords/provider/words_around.provider.dart';
import 'package:littlewords/widgets/word_card.dart';
import 'package:littlewords/widgets/word_lite_card.dart';

import '../../db/db.helper.dart';
import '../../provider/dio.provider.dart';

class WordAround extends ConsumerWidget {
  const WordAround({Key? key, required this.word}) : super(key: key);

  final WordDTO word;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return GestureDetector(

      onTap:(){
        final Dio dio = ref.read(dioProvider);
        var url = ('/word?uid=${word.uid}&latitude=${word.latitude}&longitude=${word.longitude}');
        dio.get(url).then((response) {
          var jsonAsString = response.toString();
          var json = jsonDecode(jsonAsString);

          final OneWordDTO oneWordDTO = OneWordDTO.fromJson(json);

          if (oneWordDTO.data != null) {
            DbHelper.insert(oneWordDTO.data!);


          }
          ref.refresh(wordsAroundProvider);

          // TODO
          // 1. Afficher une snackbar
        });

      },
      child:WordLiteCard(word: word),


    );


  }
}
