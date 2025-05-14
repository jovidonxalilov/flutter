import 'package:flutter/material.dart';
import 'package:loggy/64-dars/models/product_model.dart';
import 'package:loggy/64-dars/view_models/cart_viewmodel.dart';
import 'package:loggy/64-dars/view_models/products_viewmodel.dart';
import 'package:loggy/64-dars/views/screens/cart_screen.dart';
import 'package:loggy/64-dars/views/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final productViewmodel = ProductsViewmodel();
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ProductsViewmodel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Bozoro",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return CartScreen();
                  },
                ),
              );
            },
            icon: Badge(
              alignment: Alignment.topLeft,
              label: Consumer<CartViewmodel>(
                builder: (context, cartView, child) {
                  return Text(
                    cartView.cartProducts.length.toString(),
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
              child: Icon(Icons.shopping_bag, size: 40),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView.builder(
          itemCount: productViewmodel.products.length,
          itemBuilder: (ctx, index) {
            final product = productViewmodel.products[index];
            return ProductItem(product: product);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              width: double.infinity,
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
                child: Column(
                  spacing: 15,
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(hintText: "Nomi"),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: priceController,
                        decoration: InputDecoration(hintText: "Narxi"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState?.validate() ?? false) {
                        //   double.tryParse(priceController.text ) ?? 0.0;
                        //   final newProduct = ProductModel(id: vm.products.length+1, title: vm.products.titleController, color: color, price: price)
                        // }
                      },
                      child: Center(
                        child: Text("Qo'shish"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Center(
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
