import 'package:flutter/foundation.dart';

import '../models/product_model.dart';

class CartViewmodel extends ChangeNotifier {
  final List<ProductModel> cartProducts = [];
  final List newProduct = [];

  double getTotal() {
    return cartProducts.fold(0, (umumiySumma, hozirgiMahsulot) {
      return umumiySumma + hozirgiMahsulot.price;
    });
  }

  bool isInCart(int id) {
    return cartProducts.any((product) => product.id == id);
  }

  void addToCart(ProductModel product) {
    cartProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(int id) {
    cartProducts.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  void addNewProduct(
    int? id,
    String? title,
    double? price,
  ) {
    return addNewProduct(id, title, price);
  }
  // void addToBody() {
  //   newProduct.addAll();
  // }
}
