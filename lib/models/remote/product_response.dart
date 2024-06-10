import 'package:flutter/cupertino.dart';

class ProductResponse {
  final int id;
  final String title;
  final String description;
  final double price;
  final String brand;
  final List<String> images;

  ProductResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.images
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
        id: json["id"],
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        price: double.tryParse(json["price"].toString()) ?? 0.0,
        brand: json["brand"] ?? "-",
        images: (json["images"] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? []
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "brand": brand
    };
  }

}
