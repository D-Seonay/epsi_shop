import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(dynamic product) {
    final index = _cartItems.indexWhere((item) => item.product['id'] == product['id']);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(dynamic product) {
    _cartItems.removeWhere((item) => item.product['id'] == product['id']);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (total, item) => total + (item.product['price'] * item.quantity * 1.2));
  }
}
