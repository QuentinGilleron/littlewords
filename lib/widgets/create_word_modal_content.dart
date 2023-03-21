import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod/src/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../beans/dto/word.dto.dart';
import '../provider/device_location.provider.dart';
import '../provider/dio.provider.dart';
import '../provider/username.provider.dart';
import '../routes/home/word_around.dart';

class CreateWordModalContent extends StatefulWidget {
  CreateWordModalContent({Key? key}) : super(key: key);

  @override
  State<CreateWordModalContent> createState() => _CreateWordModalContentState();
}

class _CreateWordModalContentState extends State<CreateWordModalContent> {
  TextEditingController? txtController;

  @override
  void initState() {
    super.initState();
    txtController = TextEditingController();
    txtController!.addListener(() {
      // Permet de forcer le redessin et d'activer ou pas le bouton send
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.end, // Permet de tout coller en bas
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              controller: txtController,
              maxLength: 144,

            decoration: InputDecoration(
              // Faire un trait en dessous du champs texte
              filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: wordSaveButton(controller: txtController,),
          )
        ],
    );


  }
}

class wordSaveButton extends ConsumerWidget {
  wordSaveButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController? controller;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ref.watch(deviceLocationProvider)
       .when(data: (data) => _whenData(data, ref, context), error: _whenError, loading: _whenLoading);


  }

  bool _isTextFieldFilled(TextEditingController controller) {
    return controller.text.trim().isEmpty;
  }

  void _envoieMessage(final WidgetRef ref, LatLng? dataLocation, BuildContext context) async {


    var prefs = await SharedPreferences.getInstance();
    const String key = 'username';
    final String? username = prefs.getString(key);

    final String? author = username;
    final String content = controller!.text;

    print('author: $author -- content: $content');

    final double latitude = dataLocation!.latitude;
    final double longitude = dataLocation.longitude;

    var dio = ref.read(dioProvider);
    dio
        .post('/word', data: WordDTO(null, author, content, latitude, longitude))
        .then((value) => print(value.toString()));

    // Fermer la modal
    Navigator.of(context).pop();
    // Rafraichir la liste des mots
    ref.refresh(deviceLocationProvider);

  }

  Widget _whenData(LatLng? data, WidgetRef ref, BuildContext context) {
    return ElevatedButton(
      onPressed: _isTextFieldFilled(controller!) ? null : () => _envoieMessage(ref, data, context) ,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48)
      ),
      child: const Text('Déposer le petit mot'),

    );
  }

  Widget _whenError(Object error, StackTrace stackTrace) {
    return Center(child: Text(error.toString()));
  }

  Widget _whenLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}

