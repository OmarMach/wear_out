import 'package:flutter/material.dart';
import 'package:wear_out/models/product.dart';

import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  final Cart cart = Cart();

  bool productAlreadyInCart(Product product, String size) {
    try {
      cart.cartItems.firstWhere((element) => element.product == product && element.size == size);
      return true;
    } catch (e) {
      return false;
    }
  }

  int getProductQuantity(Product product, String size) {
    if (productAlreadyInCart(product, size)) {
      return cart.cartItems.firstWhere((element) => element.product == product && element.size == size).quantity;
    } else {
      return 0;
    }
  }

  void addProduct({required Product product, required String size, int quantity = 1}) {
    if (productAlreadyInCart(product, size)) {
      int itemIndex = cart.cartItems.indexWhere((element) => element.product == product && element.size == size);
      CartItem item = cart.cartItems.elementAt(itemIndex);
      cart.cartItems[itemIndex] = item.copyWith(quantity: item.quantity + quantity);
    } else {
      cart.cartItems.add(CartItem(product: product, quantity: quantity, size: size));
    }
    notifyListeners();
  }

  void deleteProduct({required Product product, required String size}) {
    print('Deleting');
    cart.cartItems.removeWhere((element) => element.product == product && element.size == size);
    notifyListeners();
  }

  void decrementProductQuantity({required Product product, required String size}) {
    try {
      int itemIndex = cart.cartItems.indexWhere((element) => element.product == product && element.size == size);
      CartItem item = cart.cartItems.elementAt(itemIndex);
      if (item.quantity <= 1) {
        deleteProduct(product: product, size: size);
      } else {
        cart.cartItems[itemIndex] = item.copyWith(quantity: item.quantity - 1);
        print('here');
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
