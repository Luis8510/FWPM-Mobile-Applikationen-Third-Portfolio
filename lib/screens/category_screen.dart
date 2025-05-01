import 'package:flutter/material.dart';
import 'package:thirdportfolioexam/screens/receipe_list_screen.dart';
import '../classes/receipe.dart';

class CategoryScreen extends StatelessWidget {
  final List<Recipe> recipes;
  const CategoryScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final categories = recipes.map((r) => r.category).toSet().toList()..sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuisine Categories'),
      ),
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (_, index) {
          final category = categories[index];
          return ListTile(
            title: Text(category.toUpperCase()[0] +
                category.toUpperCase().substring(1).toLowerCase()),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              final firstThree =
                  recipes.where((r) => r.category == category).take(3).toList();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RecipeListScreen(
                    category: category,
                    recipes: firstThree,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
