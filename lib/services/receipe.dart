import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:food_world/models/receipe.dart';

class ReceipeProvider extends ChangeNotifier {
  Dio _dio = new Dio();
  List<Receipe> items = [];
  List<Receipe> filterItems = [];
  bool isLoading = true;

  List<Receipe> get receipies => filterItems;

  List<Receipe> receipeFromJson(List<dynamic> response) {
    return response
        .map(
          (e) => Receipe(
            e['vegetarian'],
            e['vegan'],
            e['dairyFree'],
            e['cheap'],
            e['veryPopular'],
            e['aggregateLikes'].toString(),
            e['healthScore'].toString(),
            e['id'].toString(),
            e['title'],
            e['readyInMinutes'].toString(),
            e['servings'].toString(),
            e['image'],
            e['dishTypes'],
            e['analyzedInstructions'],
            e['pricePerServing'].toString(),
          ),
        )
        .toList();
  }

  Future<void> fetchItems() async {
    if (isLoading) {
      Response response = await _dio.get(
          'https://api.spoonacular.com/recipes/random?apiKey=67792dd4c0984a679094b58757eadea8&number=90');
      items = filterItems = receipeFromJson(response.data['recipes']);
      isLoading = false;
      notifyListeners();
    }
  }
}
