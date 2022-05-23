import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';

abstract class Provider {
  Future<List<Drink>> searchData(String searchText);
}
