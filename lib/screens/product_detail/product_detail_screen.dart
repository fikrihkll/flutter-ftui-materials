import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/blocs/product_management/product_management_bloc.dart';
import 'package:hello_world/models/ui/product.dart';
import 'package:hello_world/repositories/product_repository.dart';
import 'package:hello_world/utils/remote_helper.dart';
import 'package:hello_world/widgets/loading_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product? product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  late ThemeData _theme;
  bool _isLoading = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final ProductManagementBloc _productManagementBloc = ProductManagementBloc(
      productRepository: ProductRepository(RemoteHelper.getDio()));

  @override
  void initState() {
    if (widget.product != null) {
      // Set the product data that will be updated
      _nameController.text = widget.product!.title;
      _priceController.text = widget.product!.price.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return BlocProvider<ProductManagementBloc>(
      create: (context) => _productManagementBloc,
      child: BlocListener<ProductManagementBloc, ProductManagementState>(
        listener: (context, state) {
          if (state is ProductLoading) {
            // Disable button
            _isLoading = true;
            setState(() {
            });
          } else if (state is ProductCreatedSuccessful) {
            // Retrieve the new product
            var newProduct =  state.product;
            // Go back to the previous screen with the new value
            Navigator.pop(context, ProductCreatedResult(product: newProduct));
          } else if (state is ProductUpdatedSuccessful) {
            // Retrieve the updated product
            var updatedProduct =  state.product;
            // Go back to the previous screen with the new value
            debugPrint("UPDATED p ${updatedProduct.price}");
            Navigator.pop(context, ProductUpdatedResult(product: updatedProduct));
          } else if (state is ProductDeletedSuccessful) {
            // Go back to the previous screen with the deleted product information
            Navigator.pop(context, ProductDeletedResult(product: widget.product!));
          } else if (state  is ProductError) {
            // enable button
            _isLoading = false;
            setState(() {
            });

            // Show error message
            _showMessage(state.message);
          }
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text(
                widget.product == null ? "Create Product" : "Edit Product",
                style: _theme.textTheme.headlineSmall,
              ),
            ),
            body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name",
                        style: _theme.textTheme.labelMedium,
                      ),
                      TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(hintText: "Type product name"),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Product Price",
                        style: _theme.textTheme.labelMedium,
                      ),
                      TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            hintText: "Set product price",
                            prefixText: "Rp.",
                            prefixStyle: _theme.textTheme.bodyMedium),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: LoadingButton(
                                isLoading: _isLoading,
                                onPressed: _onCreateOrUpdateClick,
                                text: widget.product == null ? "Create" : "Save"
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      widget.product != null ? (
                        Row(
                          children: [
                            Expanded(
                              child: LoadingButton(
                                  buttonColor: _theme.colorScheme.error,
                                  onPressed: _onDeleteClick,
                                  isLoading: _isLoading,
                                  text: "Delete",
                              ),
                            )
                          ],
                        )
                      ) : (
                        const SizedBox()
                      ),
                    ],
                  ),
                )
            )
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _onCreateOrUpdateClick() {
    // When widget.product is not null,
    // we will update the existing product
    if (widget.product != null) {
      _productManagementBloc.add(
          UpdateProductEvent(
              id: widget.product!.id,
              name: _nameController.text,
              price: double.tryParse(_priceController.text) ?? 0
          )
      );
    } else {
      _productManagementBloc.add(
          CreateProductEvent(
              name: _nameController.text,
              price: double.tryParse(_priceController.text) ?? 0
          )
      );
    }

  }

  void _onDeleteClick() {
    if (widget.product != null) {
      _productManagementBloc.add(
          DeleteProductEvent(
            id: widget.product!.id,
          )
      );
    }
  }
}

class ProductCreatedResult {
  final Product product;
  ProductCreatedResult({required this.product});
}
class ProductUpdatedResult {
  final Product product;
  ProductUpdatedResult({required this.product});
}
class ProductDeletedResult {
  final Product product;
  ProductDeletedResult({required this.product});
}
