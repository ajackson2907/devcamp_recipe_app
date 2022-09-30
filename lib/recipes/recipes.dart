class Recipes {
  String name;
  String imageUrl;
  String prepTime;
  int servings;
  int rating;
  int reviews;
  List<RecipeDetails> details;
  Recipes({
    required this.name,
    required this.imageUrl,
    required this.prepTime,
    required this.servings,
    required this.rating,
    required this.reviews,
    required this.details,
  });
}

class RecipeDetails {
  String steps;
  String ingredients;
  String calories;
  RecipeDetails({
    required this.steps,
    required this.ingredients,
    required this.calories,
  });
}

final List<Recipes> recipes = [
  Recipes(
    name: "Crock Pot Roast",
    imageUrl: "http://img.sndimg.com/food/image/upload/w_266/v1/img/recipes/27/20/8/picVfzLZo.jpg",
    prepTime: "4 hours",
    servings: 4,
    rating: 4,
    reviews: 326,
    details: [
      RecipeDetails(
        steps:
            "Place beef roast in crock pot. Mix the dried mixes together in a bowl and sprinkle over the roast. Pour the water around the roast. Cook on low for 7-9 hours.",
        ingredients:
            " 1 beef roast\n 1 package brown gravy mix\n 1 package dried Italian salad dressing mix\n 1 package dry ranch dressing mix\n 1/2 cup water",
        calories: "750",
      ),
    ],
  ),
  Recipes(
    name: "Roasted Asparagus",
    imageUrl: "http://img.sndimg.com/food/image/upload/w_266/v1/img/recipes/50/84/7/picMcSyVd.jpg",
    prepTime: "35 minutes",
    servings: 2,
    rating: 2,
    reviews: 3,
    details: [
      RecipeDetails(
        steps:
            "Preheat oven to 425°F. Cut off the woody bottom part of the asparagus spears and discard. With a vegetable peeler, peel off the skin on the bottom 2-3 inches of the spears. Place asparagus on foil-lined baking sheet and drizzle with olive oil. Sprinkle with salt. With your hands, roll the asparagus around until they are evenly coated with oil and salt. Roast for 10-15 minutes, depending on the thickness of your stalks and how tender you like them. They should be tender when pierced with the tip of a knife. The tips of the spears will get very brown but watch them to prevent burning. They are great plain, but sometimes I serve them with a light vinaigrette if we need something acidic to balance out our meal.",
        ingredients: " 1 lb asparagus\n 1 1/2 tbsp olive oil\n 1/2 tsp kosher salt\n",
        calories: "250",
      ),
    ],
  ),
  Recipes(
    name: "Curried Lentils and Rice",
    imageUrl: "https://www.acouplecooks.com/wp-content/uploads/2014/02/Mesir-Wat-001.jpg",
    prepTime: "75 minutes",
    servings: 4,
    rating: 1,
    reviews: 3563,
    details: [
      RecipeDetails(
        steps:
            "Add hot water to yeast in a large bowl and let sit for 15 minutes. Mix in oil, sugar, salt, and flour and let sit for 1 hour. Knead the dough and spread onto a pan. Spread pizza sauce and sprinkle cheese. Add any optional toppings as you wish. Bake at 400 deg Fahrenheit for 15 minutes.",
        ingredients:
            " 5 teaspoons yeast\n 5 cups flour\n 4 tablespoons vegetable oil\n 2 tablespoons sugar\n 2 teaspoons salt\n 2 cups hot water\n 1/4 cup pizza sauce\n 3/4 cup mozzarella cheese\n",
        calories: "953",
      ),
    ],
  ),
];
