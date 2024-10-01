import 'package:flutter/cupertino.dart';

import '../model/ow_hero.dart';
import '../service/ow_hero_service.dart';

class OwHeroProvider extends ChangeNotifier {
  final _service = OwHeroService();
  bool isLoading = false;

  List<OwHero> _heroes = [];
  List<OwHero> get heroes => _heroes;

  OwHeroDetails? _hero;
  OwHeroDetails? get hero => _hero;

  Future<void> getAllHeroes() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();
    _heroes = response.cast<OwHero>();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getHeroDetails(String key) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getHeroDetails(key);
    _hero = response;
    isLoading = false;
    notifyListeners();
  }
}