import 'package:flutter/material.dart';
import 'package:littlewords/app.dart';
import 'package:littlewords/db/db.helper.dart';

void main() {

  // Initialize the database
  WidgetsFlutterBinding.ensureInitialized();
  DbHelper.initDb();

  runApp(const LittleWordsApp());
}
