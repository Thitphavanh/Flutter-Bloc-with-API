import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../cocktail_db/cocktail_db.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<SearchEvent>(
      (event, emit) async {
        emit(ProductLoading());
        try {
          //
          var url = Uri.https('www.thecocktaildb.com',
              '/api/json/v1/1/search.php', {'s': event.searchText});
          var result = await http.get(url);
          if (result.statusCode != 200) {
            if (kDebugMode) {
              print('Error');
            }
          }

          var drinks = CocktailDb.fromJson(result.body).drinks;
          if (drinks == null) {
            emit(ProductError('No drinks found'));
            return;
          }

          emit(ProductFinishState(drinks));
        } catch (e) {
          emit(ProductError(e.toString()));
          return;
        }
      },
    );
  }
}
