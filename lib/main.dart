import 'package:flutter/material.dart';
import 'package:thirdportfolioexam/screens/category_screen.dart';
import 'package:thirdportfolioexam/services/service.dart';

import 'classes/receipe.dart';

void main() => runApp(const RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      title: 'Recipes',
      home: FutureBuilder<List<Recipe>>(
        future: RecipeService.loadRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Fehler: ${snapshot.error}')),
            );
          }
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return CategoryScreen(recipes: snapshot.data!);
        },
      ),
    );
  }
}
