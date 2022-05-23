import 'package:flutter_bloc_with_api/repository/mock_provider.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';
import 'package:flutter_bloc_with_api/repository/provider.dart';
import 'product_db_provider copy.dart';

class ProductRepository {
  final Provider provider;
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
