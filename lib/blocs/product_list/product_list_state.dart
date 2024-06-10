part of 'product_list_bloc.dart';

@immutable
sealed class ProductListState {}

final class ProductListInitial extends ProductListState {}
final class ProductListLoaded extends ProductListState {
  final List<Product> products;

  ProductListLoaded({required this.products});
}
final class ProductListError extends ProductListState {
  final String message;

  ProductListError({required this.message});
}
final class ProductListLoading extends ProductListState {}
