import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_with_api/cocktail_db/cocktail_db.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';
import 'package:flutter_bloc_with_api/repository/provider.dart';
import 'package:http/http.dart' as http;

class MockProvider extends Provider {
  @override
  Future<List<Drink>> searchData(String searchText) async {
    return List<Drink>.generate(
      100,
      (index) => Drink(
        strDrink: 'Drink $index',
        strCategory: 'Category ${index % 10}',
        strDrinkThumb: 'https://picsum.photos/id/$index/200/300',
      ),
    );
  }
}
