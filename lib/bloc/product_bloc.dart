import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_with_api/cocktail_db/drink.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../cocktail_db/cocktail_db.dart';
import 'product_repository.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInitial()) {
    on<SearchEvent>((event, emit) async {
      emit(
        ProductLoading(),
      );
      try {
        var drinks = await repository.searchData(event.searchText);
        emit(
          ProductFinishState(drinks),
        );
      } catch (e) {
        emit(
          ProductError(
            e.toString(),
          ),
        );
        return;
      }
    });
    on<FilterEvent>((event, emit) {
      var drinks = repository.filter(event.searchText);
      emit(ProductFinishState(drinks));
    });
  }
}
