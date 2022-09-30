import 'package:devcamp_recipe_app/recipe_details_screen.dart';
import 'package:devcamp_recipe_app/recipes/recipes.dart';
import 'package:devcamp_recipe_app/widgets/filter_button.dart';
import 'package:devcamp_recipe_app/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF39596F),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF39596F),
        leading: const Icon(Icons.sort),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_outlined),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF39596F),
        elevation: 0,
        selectedItemColor: const Color(0xAAFFFFFF),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xAAFFFFFF),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hi Andrew,', style: TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 8),
                const Text(
                  'What do you want to cook today?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search recipes',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Most Popular Recipes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 340,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      String stars = '';
                      for (var i = 0; i < recipe.rating; i++) {
                        stars = "$stars★ ";
                      }
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => RecipeDetailsScreen(recipe: recipe))));
                        },
                        child: RecipeCard(recipe: recipe, stars: stars),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.tune_outlined,
                          color: Color(0xAAFFFFFF),
                        ),
                      ),
                      FilterButton(buttonText: 'ENTREES'),
                      FilterButton(buttonText: 'APPS'),
                      FilterButton(buttonText: 'APPETISERS'),
                      FilterButton(buttonText: 'MEATS'),
                      FilterButton(buttonText: 'VEGAN'),
                      FilterButton(buttonText: 'SALADS'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}