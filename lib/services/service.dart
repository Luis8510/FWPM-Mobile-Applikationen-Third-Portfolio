import 'dart:convert';
import 'package:flutter/services.dart';
import '../classes/receipe.dart';

class RecipeService {
  static Future<List<Recipe>> loadRecipes() async {
    final jsonString = await rootBundle.loadString('assets/json/recipes.json');
    final decoded = json.decode(jsonString) as Map<String, dynamic>;
    final list = decoded['recipes'] as List<dynamic>;
    return list
        .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }
}
