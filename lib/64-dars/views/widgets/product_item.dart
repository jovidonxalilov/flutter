import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../view_models/cart_viewmodel.dart';

class ProductItem extends StatefulWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Ink(color: widget.product.color, width: 40, height: 40),
      title: Text(widget.product.title),
      trailing: Consumer<CartViewmodel>(
        builder: (ctx, cartView, child) {
          return cartView.isInCart(widget.product.id)
              ? Icon(Icons.check)
              : TextButton(
                onPressed: () {
                  cartView.addToCart(widget.product);
                },
                child: Text("ADD"),
              );
        },
      ),
    );
  }
}
