import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/beans/dto/word.dto.dart';
import 'package:littlewords/provider/words_around.provider.dart';
import 'package:littlewords/widgets/word_card.dart';

import '../../widgets/word_lite_card.dart';

class Page1 extends ConsumerWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(wordsAroundProvider)
        .when(data: _whenData, error: _whenError, loading: _whenLoading);
  }

  Widget _whenData(List<WordDTO> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        WordDTO word = data[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: WordLiteCard(word: word),
        );
      },
    );
  }

  Widget _whenError(Object error, StackTrace stackTrace) {
    return Center(child: Text(error.toString()));
  }

  Widget _whenLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}
