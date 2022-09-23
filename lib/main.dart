import 'package:devcamp_recipe_app/recipe_details_page.dart';
import 'package:devcamp_recipe_app/recipes/recipes.dart';
import 'package:devcamp_recipe_app/widgets/filter_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
                        stars = "$stars* ";
                      }
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => RecipeDetailsPage(recipe: recipe))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 250,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
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
                              )),
                        ),
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
