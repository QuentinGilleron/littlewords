import 'package:flutter/material.dart';
class LittlewordLogo extends StatelessWidget {
  const LittlewordLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 128,
      decoration: BoxDecoration(

        color: Colors.lightGreenAccent,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.lightGreen, width: 8)
      ),
    );
  }
}
