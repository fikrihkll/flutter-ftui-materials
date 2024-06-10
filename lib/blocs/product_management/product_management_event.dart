part of 'product_management_bloc.dart';

@immutable
sealed class ProductManagementEvent {}

final class CreateProductEvent extends ProductManagementEvent {
  final String name;
  final double price;

  CreateProductEvent({required this.name, required this.price});
}

final class UpdateProductEvent extends ProductManagementEvent {
  final int id;
  final String name;
  final double price;

  UpdateProductEvent({required this.id, required this.name, required this.price});
}

final class DeleteProductEvent extends ProductManagementEvent {
  final int id;

  DeleteProductEvent({required this.id});
}
