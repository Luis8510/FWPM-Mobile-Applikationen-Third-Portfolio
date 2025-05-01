import 'package:flutter/material.dart';
import '../classes/receipe.dart';

class IngredientsScreen extends StatelessWidget {
  final Recipe recipe;
  const IngredientsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients: ',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            for (var ing in recipe.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text('• $ing',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
          ],
        ),
      ),
    );
  }
}
