import 'package:flutter/material.dart';
import 'package:loggy/64-dars/view_models/cart_viewmodel.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Savatcha"),
      ),
      body: Consumer<CartViewmodel>(
        builder: (context, cartView, child) {
          return ListView.separated(
            padding: EdgeInsets.all(20),
            itemCount: cartView.cartProducts.length,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (ctx, index) {
              final product = cartView.cartProducts[index];
              return ListTile(
                title: Text("- ${product.title} \$${product.price}"),
                trailing: IconButton(
                  onPressed: () {
                    cartView.removeFromCart(product.id);
                  },
                  icon: Icon(Icons.remove),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border(top: BorderSide()),
        ),
        child: Consumer<CartViewmodel>(
          builder: (context, cartView, child) {
            return Text(
              "Umumiy: \$${cartView.getTotal()}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            );
          },
        ),
      ),
    );
  }
}
