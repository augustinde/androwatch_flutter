import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/ow_hero.dart';
import '../provider/ow_hero_provider.dart';

class OwHeroDetailsScreen extends StatefulWidget {
  const OwHeroDetailsScreen({super.key, required this.hero});

  final OwHero hero;

  @override
  State<OwHeroDetailsScreen> createState() => _OwHeroDetailsState();
}


class _OwHeroDetailsState extends State<OwHeroDetailsScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OwHeroProvider>(context, listen: false).getHeroDetails((widget.hero.key));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF43484C),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Center(
          child: Text(
            "${widget.hero.name.toUpperCase()} Details",
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
          if(value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final hero = value.hero;
          if (hero == null) {
            return const Center(
              child: Text(
                'No data found',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500
                ),
              ),
            );
          }else {
            return Container(
              color: const Color(0xFF43484C),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  color: const Color(0xFF405275),
                                  child: Image.network(
                                    hero.portrait,
                                    width: 96,
                                    height: 96,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      hero.location,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    hero.description,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ImageIcon(
                                        color: Colors.white,
                                        AssetImage('assets/images/roles/${hero
                                            .role}.png'),
                                        size: 16,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        hero.role,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          const Text(
                            "Abilities",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultTabController(
                            length: hero.abilities.length,
                            child: Column(
                              children: [
                                TabBar(
                                  isScrollable: false,
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: const Color(0xFFF99E1A),
                                  tabs: hero.abilities.map(
                                          (e) =>
                                          Tab(
                                            icon: Image.network(
                                              width: 50,
                                              height: 30,
                                              e.icon,
                                            ),
                                          )
                                  ).toList(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 200,
                                  child: TabBarView(
                                    children: hero.abilities.map((e) =>
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                e.name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                              Text(
                                                e.description,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ],
                                          ),
                                        )).toList(),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}