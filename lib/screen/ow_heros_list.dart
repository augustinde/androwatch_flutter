import 'package:androwatch_flutter/provider/ow_hero_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwHerosList extends StatefulWidget {
  const OwHerosList({super.key});

  @override
  State<OwHerosList> createState() => _OwHerosListState();
}

class _OwHerosListState extends State<OwHerosList> {
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
        backgroundColor: const Color(0xFF43484C),
        title: Center(
          child: Text(
            'Overwatch 2 Heroes'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
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
          return Container(
            color: const Color(0xFF43484C),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                children: heroes.map((hero) {
                  return Card(
                    color: const Color(0xFF218FFE),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF405275), // Set your desired background color here
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ), // Set your desired border radius here
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8), // Match the border radius
                            child: Image.network(
                              hero.portrait,
                              width: 96,
                              height: 96,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hero.name,
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            ImageIcon(
                              color: Colors.white,
                              AssetImage('assets/images/roles/${hero.role}.png'),
                              size: 16,
                            )
                          ],
                        ),
                      ],
                    )
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}