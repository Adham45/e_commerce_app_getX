import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/view_model/home_view_model.dart';
import 'package:e_commerce_app/view/details_view.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final List<String> names = <String>['a', 'd', 'h', 'a', 'm'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 100,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(
                        height: 50,
                      ),
                      CustomText(
                        text: "Categories",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewCategories(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See All",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _listViewCategories() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  DetailsScreen(
                    productModel: controller.productModel[index],
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                        ),
                        height: 220,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].description,
                        alignment: Alignment.bottomLeft,
                        color: Colors.grey,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          "\$",
                      alignment: Alignment.bottomLeft,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
