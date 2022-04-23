import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view/checkout/checkout_view.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Scaffold(
        body: controller.cartProducts.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      "assets/images/cart_empty.svg",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "Cart Empty",
                    fontSize: 32,
                    alignment: Alignment.center,
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 140,
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 140,
                                  child: Image.network(
                                    controller.cartProducts[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: controller
                                          .cartProducts[index].name,
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      text:
                                          "\$ ${controller.cartProducts[index].price}",
                                      color: primaryColor,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 140,
                                      color: Colors.grey.shade200,
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .increaseQuantity(index);
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomText(
                                            color: Colors.black,
                                            alignment: Alignment.center,
                                            text: controller
                                                .cartProducts[index]
                                                .quantity
                                                .toString(),
                                            fontSize: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () => controller
                                                .decreaseQuantity(index),
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                bottom: 20,
                                              ),
                                              child: Icon(
                                                Icons.minimize,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: controller.cartProducts.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: "TOTAL",
                              color: Colors.grey,
                              fontSize: 22,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GetBuilder<CartViewModel>(
                              init: Get.find<CartViewModel>(),
                              builder: (controller) => CustomText(
                                text: "\$ ${controller.totalPrice}",
                                color: primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.all(20),
                            height: 100,
                            width: 180,
                            child: CustomGeneralButton(
                              text: "CHECKOUT",
                              onTap: () {
                                Get.to(
                                  CheckoutView(),
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
