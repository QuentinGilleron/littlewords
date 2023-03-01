import 'package:flutter/material.dart';
import 'package:littlewords/widgets/littlewords_logo.dart';
class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

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
          decoration: InputDecoration(
              fillColor: Colors.red,
              filled: true,
          ),
        ),
            ),
        Padding(
          padding: const EdgeInsets.only(top:4.0, left: 8.0, right: 8.0, bottom: 16.0),
          child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(48)
              ),
              child: const Text('Enregistrer son  nom'),

          ),
        )
      ]),
    );
  }
}
