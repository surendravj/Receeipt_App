// https://api.spoonacular.com/recipes/random?apiKey=67792dd4c0984a679094b58757eadea8&number=2

class Receipe {
  final bool vegetarian;
  final bool vegan;
  final bool dairyFree;
  final bool cheap;
  final bool veryPopular;
  final String aggregateLikes;
  final String healthScore;
  final String id;
  final String title;
  final String readyInMinutes;
  final String servings;
  final String image;
  final List<dynamic> dishTypes;
  final List<dynamic> analyzedInstructions;
  final String pricePerServing;

  Receipe(
    this.vegetarian,
    this.vegan,
    this.dairyFree,
    this.cheap,
    this.veryPopular,
    this.aggregateLikes,
    this.healthScore,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.image,
    this.dishTypes,
    this.analyzedInstructions,
    this.pricePerServing,
  );
}
