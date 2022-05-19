import 'package:flutter_bloc_with_api/bloc/product_db_provider.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';

class Repository {
  final ProductDBProvider provider;

  Repository(this.provider);

  Future<List<Drink>> searchDatr(String searchText) async {
    final data = await provider.searchData(searchText);

    return data;
  }
}
