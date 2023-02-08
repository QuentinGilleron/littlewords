// Doit aller chercher le username dans les shared prefs
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final usernameProvider = FutureProvider<String?>((ref) async{
  var prefs = await SharedPreferences.getInstance();
  const String key = 'username';
  final String? username = prefs.getString(key);
  return username;
});