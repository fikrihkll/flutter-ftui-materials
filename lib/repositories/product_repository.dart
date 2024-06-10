import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world/models/remote/api_result.dart';
import 'package:hello_world/models/remote/product_response.dart';

class ProductRepository {

  final Dio dio;
  ProductRepository(this.dio);

  Future<ApiResult<List<ProductResponse>>> getProductList() async {
    try {
      var jsonResult = await dio
          .get("products");
      var productList = (jsonResult.data["products"] as List<dynamic>)
          .map((e) => ProductResponse.fromJson(e))
          .toList();

      return ApiResult(data: productList);
    } on DioException catch(e) {
      return ApiResult(
        isSuccess: false,
        message: (e.response?.data as Map<String, dynamic>)["message"] ?? ""
      );
    } on Exception catch(e) {
      return ApiResult(isSuccess: false, message: e.toString());
    }
  }

  Future<ApiResult<ProductResponse>> updateProduct(int productId, Map<String, dynamic> updatedProduct) async {
    try {
      var result = await dio
          .put("products/$productId", data: updatedProduct);
      return ApiResult(data: ProductResponse.fromJson(result.data as Map<String, dynamic>));
    } on DioException catch(e) {
      return ApiResult(
          isSuccess: false,
          message: (e.response?.data as Map<String, dynamic>)["message"] ?? ""
      );
    } on Exception catch(e) {
      return ApiResult(isSuccess: false, message: e.toString());
    }
  }

  Future<ApiResult<ProductResponse>> createProduct(Map<String, dynamic> product) async {
    try {
      var result = await dio
          .post("products/add", data: product);

      debugPrint("delete: ${result.data}");
      return ApiResult(data: ProductResponse.fromJson(result.data as Map<String, dynamic>));
    } on DioException catch(e) {
      return ApiResult(
          isSuccess: false,
          message: (e.response?.data as Map<String, dynamic>)["message"] ?? ""
      );
    } on Exception catch(e) {
      return ApiResult(isSuccess: false, message: e.toString());
    }
  }

  Future<ApiResult> deleteProduct(int id) async {
    try {
      await dio
          .delete("products/$id");

      return ApiResult();
    } on DioException catch(e) {
      return ApiResult(
          isSuccess: false,
          message: (e.response?.data as Map<String, dynamic>)["message"] ?? ""
      );
    } on Exception catch(e) {
      return ApiResult(isSuccess: false, message: e.toString());
    }
  }

}