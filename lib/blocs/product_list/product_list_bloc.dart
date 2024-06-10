import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hello_world/models/ui/product.dart';
import 'package:hello_world/repositories/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {

  final ProductRepository productRepository;
  final List<Product> _currentList = [];

  ProductListBloc({
    required this.productRepository
  }) : super(ProductListInitial()) {
    on<LoadProductListEvent>((event, emit) async {
      emit(ProductListLoading());

      // call the repository to fetch the data
      var result = await productRepository.getProductList();
      if (result.isSuccess) {
        // Result is successful, we map the remote object list to the UI model object
        var productMapped = result
            .data
            ?.map((e) => Product.fromRemote(e))
            .toList() ?? [];

        // Insert the mapped data to _currentList
        _currentList.clear();
        _currentList.addAll(productMapped);

        emit(
          ProductListLoaded(
            products: productMapped
          )
        );
      } else {
        // Result is error
        emit(
            ProductListError(
                message: result.message
            )
        );
      }
    });
    on<UpdateProductEvent>((event, emit) {
      var updatedProduct = event.updatedProduct;
      var index = _currentList.indexWhere((product) => product.id == updatedProduct.id);
      _currentList[index] = updatedProduct;
      emit(ProductListLoaded(products: _currentList));
    });
    on<AddNewProductEvent>((event, emit) {
      var newProduct = event.newProduct;
      _currentList.add(newProduct);
      emit(ProductListLoaded(products: _currentList));
    });
    on<DeleteProductEvent>((event, emit) {
      var deletedProduct = event.deletedProduct;
      _currentList.removeWhere((product) => product.id == deletedProduct.id);
      emit(ProductListLoaded(products: _currentList));
    });
  }
}
