import 'package:androwatch_flutter/model/ow_hero.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OwHeroService{

  final String apiUrl = "https://overfast-api.tekrop.fr/";

  Future<List<OwHero>> getAll() async {
    final response = await http.get(Uri.parse('${apiUrl}heroes'));

    if (response.statusCode == 200) {
     final json = jsonDecode(response.body) as List;
     final heroes = json.map((hero) {
       return OwHero.fromJson(hero);
     }).toList();
      return heroes;
    } else {
      return [];
    }
  }

  Future<OwHeroDetails> getHeroDetails(String key) async {
    final response = await http.get(Uri.parse('${apiUrl}heroes/$key'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return OwHeroDetails.fromJson(json);
    } else {
      throw Exception('Failed to load hero');
    }
  }
}