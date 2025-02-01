import 'package:flutter/material.dart';
import 'package:store_app/product_store/data/product_repo.dart';
import 'package:store_app/product_store/model/icecream.dart';
import 'package:store_app/product_store/model/product.dart';

double _salesTextRate = 18.0;
double _shipingCost = 10.0;

class AppStateModel extends ChangeNotifier {
  int currentIndex = 0;
  List<Icecream> _availableProducts = [];
  final _productInCart = <int, int>{};

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Map<int, int> get productInCart {
    return Map.from(_productInCart);
  }

  // List<Product> get availableProducts {
  //   return List.from(_availableProducts);
  // }

  List<Icecream> getProducts() {
    return _availableProducts;
  }

  Icecream getProductById(int id) {
    return _availableProducts.firstWhere((element) => element.id == id);
  }

  int get totalCartQuantity {
    return _productInCart.values.fold(0, (sum, val) => sum + val);
  }

  double get subTotalCost {
    return _productInCart.keys
        .map((id) => _availableProducts[id].price! * _productInCart[id]!)
        .fold(0, (sum, val) => sum + val);
  }

  double get shippingCost {
    return _shipingCost *
        _productInCart.values.fold(0.0, (sum, val) => sum + val);
  }

  double get tax {
    return subTotalCost * _salesTextRate / 100;
  }

  double get totalCost {
    return subTotalCost + _salesTextRate + tax;
  }

  void addProductToCart(int productId) {
    if (!productInCart.containsKey(productId)) {
      _productInCart[productId] = 1;
    } else {
      _productInCart[productId] = _productInCart[productId]! + 1;
    }
    notifyListeners();
  }

  void removeProductToCart(int productId) {
    if (productInCart.containsKey(productId)) {
      if (_productInCart[productId] == 1) {
        _productInCart.remove(productId);
      } else {
        _productInCart[productId] = _productInCart[productId]! - 1;
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _productInCart.clear();
    notifyListeners();
  }

  List<Icecream> search(String query) {
    return _availableProducts
        .where(
          (product) =>
              product.flavor!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  Future<void> loadProduct() async {
    _availableProducts = await ProductRepo.loadAllIcecreams();
    notifyListeners();
  }
}
