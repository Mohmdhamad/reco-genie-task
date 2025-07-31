import 'package:flutter/material.dart';
import '../../../core/model/menu_model.dart';

class CartProvider with ChangeNotifier {
  final List<MenuModel> _cartItems = [];

  List<MenuModel> get cartItems => _cartItems;

  void addToCart(MenuModel item) {
    if (!_cartItems.contains(item)) {
      _cartItems.add(item);
      notifyListeners();
    }
  }

  void removeFromCart(MenuModel item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  int get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }
}
