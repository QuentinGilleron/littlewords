import 'package:flutter/material.dart';
import 'package:littlewords/widgets/littlewords_logo.dart';
class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LittlewordLogo()),
    );
  }
}
