import 'package:bloc/bloc.dart';
import 'package:hello_world/models/ui/product.dart';
import 'package:hello_world/repositories/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_management_event.dart';
part 'product_management_state.dart';

class ProductManagementBloc extends Bloc<ProductManagementEvent, ProductManagementState> {
  
  final ProductRepository productRepository;
  
  ProductManagementBloc({
    required this.productRepository
  }) : super(ProductInitial()) {
    on<CreateProductEvent>((event, emit) async {
      // Retrieve the inputs
      String name = event.name;
      double price = event.price;

      // Validate the inputs
      var inputValidation = _validateInput(name, price);

      if (inputValidation.isNotEmpty) {
        // Inputs are not valid
        // Flow will stop here
        emit(ProductError(message: inputValidation.join(", ")));
        return;
      }

      // Inputs are valid and the process is proceeded
      emit(ProductLoading());

      // Create parameter with Map object
      var product = {
        "title": name,
        "price": price
      };

      // send parameter to repository
      var result = await productRepository
          .createProduct(product);

      if (result.isSuccess && result.data != null) {
        // Result is successful, Convert the remote object to UI model object
        var newProduct = Product.fromRemote(result.data!);
        emit(ProductCreatedSuccessful(product: newProduct));
      } else {
        // Result is error, Set error state
        emit(ProductError(message: result.message));
      }
    });
    on<UpdateProductEvent>((event, emit) async {
      int id = event.id;
      String name = event.name;
      double price = event.price;

      // Validate the inputs
      var inputValidation = _validateInput(name, price);

      if (inputValidation.isNotEmpty) {
        // Inputs are not valid
        // Flow will stop here
        emit(ProductError(message: inputValidation.join(", ")));
        return;
      }

      // Create parameter with Map object
      emit(ProductLoading());

      // Create parameter with Map object
      var product = {
        "title": name,
        "price": price.toDouble()
      };

      // Send parameter to repository
      var result = await productRepository
          .updateProduct(id, product);
      if (result.isSuccess && result.data != null) {
        // Result is successful, Convert the remote object to UI model object
        var newProduct = Product.fromRemote(result.data!);
        emit(ProductUpdatedSuccessful(product: newProduct));
      } else {
        // Result is error, set error state
        emit(ProductError(message: result.message));
      }
    });
    on<DeleteProductEvent>((event, emit) async {
      emit(ProductLoading());
      int id = event.id;

      // Send id to repository
      var result = await productRepository
          .deleteProduct(id);

      if (result.isSuccess) {
        // Result is successful, set successful state
        emit(ProductDeletedSuccessful());
      } else {
        // Result is error, set error state
        emit(ProductError(message: result.message));
      }
    });
  }

  List<String> _validateInput(String name, double price) {
    List<String> validationMessage = [];
    if (name.isEmpty) {
      validationMessage.add("Nama tidak boleh kosong!");
    }
    if (price < 0) {
      validationMessage.add("Harga tidak valid!");
    }

    return validationMessage;
  }

}
