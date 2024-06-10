import 'package:flutter/material.dart';
import 'package:hello_world/models/remote/user_response.dart';
import 'package:hello_world/models/ui/product.dart';
import 'package:intl/intl.dart';

class ProductCardWidget extends StatelessWidget {

  final Function(Product entity) onCardClicked;
  final Product entity;
  late ThemeData _theme;

  ProductCardWidget({
    super.key,
    required this.entity,
    required this.onCardClicked});

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onCardClicked(entity);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 64,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Image.network(
                          entity.images.firstOrNull ?? "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 8,),
                          Expanded(child: Text(entity.title, style: _theme.textTheme.headlineMedium, maxLines: 2, overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 8,),
                          Icon(Icons.discount, color: _theme.colorScheme.onPrimary, size: 16,),
                          const SizedBox(width: 8,),
                          Text(entity.brand, style: _theme.textTheme.labelLarge?.copyWith(color: _theme.colorScheme.onPrimary, fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8,),
            Text(entity.description, maxLines: 3, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8,),
            Text(_formatPrice(entity.price), style: _theme.textTheme.titleLarge,),
          ],
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    return NumberFormat.simpleCurrency(locale: 'en_US', name: 'USD', decimalDigits: 2).format(price);
  }

}
