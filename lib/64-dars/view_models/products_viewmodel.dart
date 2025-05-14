import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductsViewmodel extends ChangeNotifier {
  final List<ProductModel> products = [
    ProductModel(id: 1, title: "Olma", color: Colors.red, price: 5900),
    ProductModel(id: 2, title: "Qulupnay", color: Colors.red, price: 25900),
    ProductModel(id: 3, title: "Dovcha", color: Colors.green, price: 10900),
    ProductModel(id: 4, title: "Tarvuz", color: Colors.red, price: 105900),
    ProductModel(id: 5, title: "Qovun", color: Colors.orange, price: 159000),
  ];
  void addProduct(ProductModel newProduct) {
    products.add(newProduct);
    notifyListeners();
  }

}
