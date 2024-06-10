import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/blocs/login/login_bloc.dart';
import 'package:hello_world/blocs/product_list/product_list_bloc.dart';
import 'package:hello_world/models/ui/product.dart';
import 'package:hello_world/repositories/product_repository.dart';
import 'package:hello_world/repositories/user_repository.dart';
import 'package:hello_world/screens/home/widgets/product_card_widget.dart';
import 'package:hello_world/screens/login/login_page.dart';
import 'package:hello_world/screens/product_detail/product_detail_screen.dart';
import 'package:hello_world/utils/remote_helper.dart';
import 'package:hello_world/utils/shared_preference_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ThemeData _theme;

  final ProductListBloc _productListBloc = ProductListBloc(
      productRepository: ProductRepository(RemoteHelper.getDio()));
  final LoginBloc _loginBloc = LoginBloc(
      userRepository: UserRepository(RemoteHelper.getDio(), SharedPreferenceHelper.getInstance()));
  
  @override
  void initState() {
    _productListBloc.add(LoadProductListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
            create: (context) => _productListBloc
        ),
        BlocProvider<LoginBloc>(
            create: (context) => _loginBloc
        )
      ],
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginCleared) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => route is HomePage
            );
          }
        },
        child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                          child: Row(
                            children: [
                              Expanded(child: Text("Products", style: Theme.of(context).textTheme.headlineMedium,)),
                              IconButton(
                                  onPressed: _onCreateProductClick,
                                  icon: const Icon(Icons.add)
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _loginBloc.add(ClearLoginDataEvent());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                                child: Text("Log-out", style: _theme.textTheme.labelMedium?.copyWith(color: _theme.colorScheme.error),),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        BlocBuilder<ProductListBloc, ProductListState>(
                            builder: (context, state) {
                              if (state is ProductListLoading) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (state is ProductListLoaded) {
                                return ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: state.products.length,
                                    itemBuilder: (context, position) {
                                      return ProductCardWidget(
                                        entity: state.products[position],
                                        onCardClicked: _onCardClicked,
                                      );
                                    }
                                );
                              } else if (state is ProductListError) {
                                return Center(
                                  child: Text("Error: ${state.message}"),
                                );
                              } else {
                                return const SizedBox();
                              }
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void _onCardClicked(Product product) async {
    // Launch the product detail screen and wait for the result
    var result = await Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)));
    // Check the result type
    if (result is ProductUpdatedResult) {
      // Update the current list data with the product that we have just updated
      _productListBloc.add(UpdateProductEvent(updatedProduct: result.product));
    } else if (result is ProductDeletedResult) {
      // Add new product to the current list based on the product result
      _productListBloc.add(DeleteProductEvent(deletedProduct: result.product));
    }
  }

  void _onCreateProductClick() async {
    // Launch product detail screen and wait for the result
    var result = await Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductDetailScreen(product: null)));

    // Check the result type
    if (result is ProductCreatedResult) {
      // Add update product to the current list based on the product result
      _productListBloc.add(AddNewProductEvent(newProduct: result.product));
    }
  }

}
