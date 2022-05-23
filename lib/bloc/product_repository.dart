import 'package:flutter_bloc_with_api/bloc/product_db_provider.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';

class ProductRepository {
  final ProductDBProvider provider;
  List<Drink> rawData = [];

  ProductRepository(this.provider);

  Future<List<Drink>> searchData(String searchText) async {
    rawData = await provider.searchData(searchText);

    return rawData;
  }

  List<Drink> filter(String? filter) {
    if (filter == null) {
      return rawData;
    }

    return rawData.where((element) => element.strCategory == filter).toList();
  }
}
