import 'package:flutter/material.dart';
import 'package:thirdportfolioexam/screens/ingredients_screen.dart';
import '../classes/receipe.dart';

class RecipeListScreen extends StatelessWidget {
  final String category;
  final List<Recipe> recipes;
  const RecipeListScreen({
    super.key,
    required this.category,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.toUpperCase())),
      body: ListView.separated(
        itemCount: recipes.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (_, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => IngredientsScreen(recipe: recipe),
              ),
            ),
          );
        },
      ),
    );
  }
}
