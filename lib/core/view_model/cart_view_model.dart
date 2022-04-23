import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:get/get.dart';

import '../services/database/local_database_cart.dart';


class CartViewModel extends GetxController {
  List<CartProductModel> _cartProducts = [];

  List<CartProductModel> get cartProducts => _cartProducts;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  @override
  void onInit() {
    getCartProducts();
    getTotalPrice();
    super.onInit();

  }

  getCartProducts() async {
    _cartProducts = await LocalDatabaseCart.db.getAllProducts();
    getTotalPrice();
    update();
  }

  addProduct(CartProductModel cartModel) async {
    bool _isExist = false;
    _cartProducts.forEach((element) {
      if (element.productId == cartModel.productId) {
        _isExist = true;
      }
    });
    if (!_isExist) {
      await LocalDatabaseCart.db.insertProduct(cartModel);
      getCartProducts();
    }
  }

  removeProduct(String productId) async {
    await LocalDatabaseCart.db.deleteProduct(productId);
    getCartProducts();
  }

  removeAllProducts() async {
    await LocalDatabaseCart.db.deleteAllProducts();
    getCartProducts();
  }

  getTotalPrice() {
    _totalPrice = 0;
    _cartProducts.forEach((cartProduct) {
      _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    });
  }

  increaseQuantity(int index) async {
    _cartProducts[index].quantity++;
    getTotalPrice();
    await LocalDatabaseCart.db.update(_cartProducts[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProducts[index].quantity != 0) {
      _cartProducts[index].quantity--;
      getTotalPrice();
      await LocalDatabaseCart.db.update(_cartProducts[index]);
      update();
    }
  }
}