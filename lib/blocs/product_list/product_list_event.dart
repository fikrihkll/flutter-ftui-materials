part of 'product_list_bloc.dart';

@immutable
sealed class ProductListEvent {}

class LoadProductListEvent extends ProductListEvent {}

class UpdateProductEvent extends ProductListEvent {
  final Product updatedProduct;
  UpdateProductEvent({required this.updatedProduct});
}

class AddNewProductEvent extends ProductListEvent {
  final Product newProduct;
  AddNewProductEvent({required this.newProduct});
}

class DeleteProductEvent extends ProductListEvent {
  final Product deletedProduct;
  DeleteProductEvent({required this.deletedProduct});
}
