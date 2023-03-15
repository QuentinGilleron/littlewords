import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/widgets/littlewords_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/username.provider.dart';
class LoginRoute extends StatelessWidget {
  LoginRoute({Key? key}) : super(key: key);

  final _txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Permet de tout coller en bas
          children: [
            Spacer(), // Permet d'espacer du haut
            LittlewordLogo(),
            Spacer(), // Permet d'espacer du bas
            Padding(
              padding: EdgeInsets.all(8.0), // Espace un peu sur les coters
              child: TextField(
                controller: _txtController,
          decoration: InputDecoration(
              fillColor: Colors.red,
              filled: true,
          ),
        ),
            ),
        Padding(
          padding: const EdgeInsets.only(top:4.0, left: 8.0, right: 8.0, bottom: 16.0),
          child: SaveUsernameButton(
              controller: _txtController
          ),
        )
      ]),
    );
  }

}


class SaveUsernameButton extends ConsumerWidget {
  const SaveUsernameButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => _onPressed(ref),
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48)
      ),
      child: const Text('Enregistrer son  nom'),

    );
  }

  void _onPressed(WidgetRef ref) {
    var text = controller.text;
    // print('Test:$text'); // Print le nom saisi
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('username', text);
      ref.refresh(usernameProvider);
    });
  }
}

// var dio = ref.read(dioProvider);
// dio.post('/word', data: wordDTO(null, 'test', 'test', 1.0, 1.0))
// .then((value) => print(value.toString()));