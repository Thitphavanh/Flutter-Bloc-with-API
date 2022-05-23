import 'package:flutter_bloc_with_api/bloc/product_db_provider.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';

class ProductRepository {
  final ProductDBProvider provider;

  ProductRepository(this.provider);

  Future<List<Drink>> searchData(String searchText) async {
    final data = await provider.searchData(searchText);

    return data;
  }
}
