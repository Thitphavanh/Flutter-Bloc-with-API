// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

class ProductFinishState extends ProductState {
  final List<Drink> drinks;

  ProductFinishState(this.drinks);
}
