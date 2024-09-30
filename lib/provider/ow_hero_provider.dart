import 'package:flutter/cupertino.dart';

import '../model/ow_hero.dart';
import '../service/ow_hero_service.dart';

class OwHeroProvider extends ChangeNotifier {
  final _service = OwHeroService();
  bool isLoading = false;
  List<OwHero> _heroes = [];
  List<OwHero> get heroes => _heroes;

  Future<void> getAllHeroes() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();
    _heroes = response.cast<OwHero>();
    isLoading = false;
    notifyListeners();
  }
}