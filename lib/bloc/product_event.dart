part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class SearchEvent extends ProductEvent {
  final String searchText;

  SearchEvent(this.searchText);
}
