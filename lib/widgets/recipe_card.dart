import 'package:devcamp_recipe_app/recipes/recipes.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.recipe,
    required this.stars,
  }) : super(key: key);

  final Recipes recipe;
  final String stars;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 50),
                Hero(
                  tag: recipe.name,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(recipe.imageUrl),
                    radius: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              recipe.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Container(
              color: const Color(0xAAFFFFFF),
              height: 1,
              width: 150,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                const Icon(
                  Icons.timer,
                  size: 14,
                  color: Colors.white,
                ),
                Text(
                  ' ${recipe.prepTime}',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.person,
                  size: 14,
                  color: Colors.white,
                ),
                Text(
                  " ${recipe.servings.toString()} servings",
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                Text(
                  stars,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Text(
                  '${recipe.reviews} reviews',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
