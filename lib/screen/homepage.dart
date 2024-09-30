import 'package:androwatch_flutter/provider/ow_hero_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OwHeroProvider>(context, listen: false).getAllHeroes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
      ),
      body: Consumer<OwHeroProvider>(
        builder: (context, value, child) {
          // If the loading it true then it will show the circular progressbar
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // If loading is false then this code will show the list of todo item
          final heroes = value.heroes;
          return ListView.builder(
            itemCount: heroes.length,
            itemBuilder: (context, index) {
              final hero = heroes[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(hero.role),
                ),
                title: Text(
                  hero.name
                ),
              );
            },
          );
        },
      ),
    );
  }
}