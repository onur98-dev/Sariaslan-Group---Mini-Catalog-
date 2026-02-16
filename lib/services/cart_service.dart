import 'package:flutter/material.dart';
import '../models/product.dart';

class CartService {
  static final List<Product> _cartItems = [];

  static final ValueNotifier<int> cartNotifier = ValueNotifier<int>(0);

  static List<Product> get cartItems => _cartItems;

  static void addToCart(Product product) {
    _cartItems.add(product);
    cartNotifier.value = _cartItems.length;
  }

  static void removeFromCart(Product product) {
    _cartItems.remove(product);
    cartNotifier.value = _cartItems.length;
  }

  static double getTotalPrice() {
    return _cartItems.fold(0, (total, item) => total + item.price);
  }

  static int getItemCount() {
    return _cartItems.length;
  }
}
