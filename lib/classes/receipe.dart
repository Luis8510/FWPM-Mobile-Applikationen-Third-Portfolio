class Recipe {
  final String name;
  final String category;
  final List<String> ingredients;

  const Recipe({
    required this.name,
    required this.category,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        name: json['name'] as String,
        category: json['category'] as String,
        ingredients: List<String>.from(json['ingredients'] as List<dynamic>),
      );
}
