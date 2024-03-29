import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/routes/home/page1.dart';
import 'package:littlewords/routes/home/page2.dart';

import '../../db/db.helper.dart';
import '../../widgets/create_word_modal_content.dart';
import '../../widgets/word_card.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int bottomNavBarIndex = 0;

  final List<Widget> bodies = [
    _Page1(),
    _Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Little Words'),
        ),
        body: bodies[bottomNavBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavBarIndex,
          selectedItemColor: Colors.amber[800],

          onTap: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },

          showSelectedLabels: false,
          // On cache les labels
          showUnselectedLabels: false,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'A',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'B',
            ),
          ],
        ),
        // On affiche le bouton que sur la page 1
        floatingActionButton: bottomNavBarIndex == 0
            ? Consumer(
                builder: (context, ref, child) {
                  return FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: CreateWordModalContent(),
                            );
                        });
                    },
                    child: const Icon(Icons.add),
                  );
                },
              )
            : null);
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Page1(),
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Page2(),
    );
  }
}

