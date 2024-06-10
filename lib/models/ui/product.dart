import 'package:hello_world/models/remote/product_response.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String brand;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.images
  });

  factory Product.fromRemote(ProductResponse remote) {
    return Product(
        id: remote.id,
        title: remote.title,
        description: remote.description,
        price: remote.price,
        brand: remote.brand,
        images: remote.images
    );
  }

  ProductResponse toRemote() {
    return ProductResponse(
        id: id,
        title: title,
        description: description,
        price: price,
        brand: brand,
        images: images
    );
  }

}
