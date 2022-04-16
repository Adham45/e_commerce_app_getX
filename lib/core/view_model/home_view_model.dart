import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/home_service.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;

    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
          CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>),
        );
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    await HomeService().getBestSellingProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
          ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>),
        );
        _loading.value = false;
      }
      update();
    });
  }
}
