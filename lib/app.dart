// import
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/provider/username.provider.dart';

import 'routes/error/error.route.dart';
import 'routes/home/home.route.dart';
import 'routes/loading/loading.route.dart';
import 'routes/login/login.route.dart';


class LittleWordsApp extends StatelessWidget {
  const LittleWordsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
        child: MaterialApp(
          title: 'Little Words',
          home: _Routing(),
        )
    );
  }
}

//
class _Routing extends ConsumerWidget {
  const _Routing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(usernameProvider).when(data: _whenData, error: _whenError, loading: _whenLoading) ;
  }

  Widget _whenData(String? username) {

    if(null == username){
      return LoginRoute();
    }
    return HomeRoute();
  }

  Widget _whenError(Object error, StackTrace stackTrace) {
    return const ErrorRoute();

  }

  Widget _whenLoading() {
    return const LoadingRoute();
  }
}