import 'package:devcamp_recipe_app/recipes/recipes.dart';
import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({super.key, required this.recipe});

  final Recipes recipe;

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (var i = 0; i < recipe.rating; i++) {
      stars = "$stars* ";
    }
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE09065),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_outlined),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFE09065),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              recipe.name,
                              maxLines: 2,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              color: const Color(0xAAFFFFFF),
                              height: 1,
                              width: 150,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 24),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' ${recipe.prepTime}',
                                    style: const TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 24),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.person,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    " ${recipe.servings.toString()} servings",
                                    style: const TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 24),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' ${recipe.details[0].calories} calories',
                                    style: const TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 24),
                              child: Row(
                                children: [
                                  Text(
                                    stars,
                                    style: const TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                  Text(
                                    ' ${recipe.reviews} reviews',
                                    style: const TextStyle(fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(recipe.imageUrl),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: [
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF233954),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 16),
                    child: Text(recipe.details[0].ingredients),
                  ),
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF233954),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(recipe.details[0].steps),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
