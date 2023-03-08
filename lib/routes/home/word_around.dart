import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/beans/dto/word.dto.dart';
import 'package:littlewords/widgets/word_card.dart';

import '../../provider/dio.provider.dart';

class WordAround extends ConsumerWidget {
  const WordAround({Key? key, required this.word}) : super(key: key);

  final WordDTO word;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return GestureDetector(
      onTap:(){
        final Dio dio = ref.read(dioProvider);
        dio.get('/word?uid=${word.uid}&latitude=${word.latitude}&longitude=${word.longitude}');
      },
      child:WordCard(word: word),

    );


  }
}
