part of 'product_management_bloc.dart';

@immutable
sealed class ProductManagementState {}

final class ProductInitial extends ProductManagementState {}

final class ProductLoading extends ProductManagementState {}

final class ProductCreatedSuccessful extends ProductManagementState {
  final Product product;
  ProductCreatedSuccessful({required this.product});
}

final class ProductUpdatedSuccessful extends ProductManagementState {
  final Product product;
  ProductUpdatedSuccessful({required this.product});
}

final class ProductError extends ProductManagementState {
  final String message;
  ProductError({required this.message});
}

final class ProductDeletedSuccessful extends ProductManagementState {}
