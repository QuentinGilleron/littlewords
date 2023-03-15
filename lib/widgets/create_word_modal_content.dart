import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // Permet de forcer le redessin et d'activer ou pas be bouton send
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
    return ElevatedButton(
      onPressed: _isTextFieldFilled(controller!) ? null : () => _envoieMessage(context) ,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48)
      ),
      child: const Text('Enregistrer son  nom'),
    );
  }

  bool _isTextFieldFilled(TextEditingController controller) {
    return controller.text.trim().isEmpty;
  }

  void _envoieMessage(BuildContext context) {
    print('Envoie du message');
  }
}

// TODO
// 1. Afficher un champs texte et un bouton de validation en dessous -- ✅
// 2. Desactiver le boutons le champs texte est vide (trim) -- ✅
// 3. Créer un ConsumerWidget pour représenter le bouton -- ✅

// 3.1. Dans ce Widget utiliser le device_location.provider.dart pour récupérer la position

// 4. Construire un WordDTO avec :
// - uid : null
// - content : valeur du champs text
// - author : nom utilisateur stocké dans les sharedPrefs
// - latitude et longitude: données du device location provider

// 5. Utiliser de dio.provider pour faire l'appel POST au service / word
// 6. Quand l'appel POST est terminé, on ferme le formulaire de création

// BONUS :
// - Donner le focus au champ text dès l'ouverture de la modal -- ✅
// - Limiter le nombre de caractère saisissable à 144
// - Afficher un compte x/144