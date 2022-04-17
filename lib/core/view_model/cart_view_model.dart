import 'package:e_commerce_app/core/services/database/cart_database_helper.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel(){
    getAllProduct();
  }
  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    _loading.value = false;
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    update();
  }
}
