import 'package:androwatch_flutter/provider/ow_hero_provider.dart';
import 'package:androwatch_flutter/screen/ow_heros_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OwHeroProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Overwatch',
        ),
        debugShowCheckedModeBanner: false,
        home: const OwHerosListScreen(),
      ),
    );
  }
}