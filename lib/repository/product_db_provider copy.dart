import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_with_api/cocktail_db/cocktail_db.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';
import 'package:flutter_bloc_with_api/repository/provider.dart';
import 'package:http/http.dart' as http;

class ProductDBProvider extends Provider {
  @override
  Future<List<Drink>> searchData(String searchText) async {
    try {
      var url = Uri.https(
        'www.thecocktaildb.com',
        '/api/json/v1/1/search.php',
        {'s': searchText},
      );
      var result = await http.get(url);
      if (result.statusCode != 200) {
        if (kDebugMode) {
          print('Error');
        }
      }

      var drinks = CocktailDb.fromJson(result.body).drinks;
      if (drinks == null) {
        throw Exception('No drinks found');
      }

      return (drinks);
    } catch (e) {
      throw Exception('API access failed');
    }
  }
}
