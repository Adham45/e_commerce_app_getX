import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants.dart';
import '../../core/view_model/cart_view_model.dart';
import '../../core/view_model/checkout_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class CheckoutView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: 'Checkout',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 24),
                child: Form(
                  key: _formKey,
                  child: GetBuilder<CheckoutViewModel>(
                    init: Get.find<CheckoutViewModel>(),
                    builder: (controller) => Column(
                      children: [
                        ListViewProducts(),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          text: 'Street',
                          hintText: '21, Tahrir Street',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid street name.';
                          },
                          onSaved: (value) {
                            controller.street = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          text: 'City',
                          hintText: 'Downtown Cairo',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid city name.';
                          },
                          onSaved: (value) {
                            controller.city = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                text: 'State',
                                hintText: 'Cairo',
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4)
                                    return 'Please enter valid state name.';
                                },
                                onSaved: (value) {
                                  controller.state = value;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 36,
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                text: 'Country',
                                hintText: 'Egypt',
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4)
                                    return 'Please enter valid city name.';
                                },
                                onSaved: (value) {
                                  controller.country = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          text: 'Phone Number',
                          hintText: '+20123456789',
                          keyBoardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10)
                              return 'Please enter valid number.';
                          },
                          onSaved: (value) {
                            controller.phone = value;
                          },
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        CustomGeneralButton(
                          text:'SUBMIT',onTap:
                              () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await controller.addCheckoutToFireStore();
                              Get.dialog(
                                AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: primaryColor,
                                          size: 200,
                                        ),
                                        CustomText(
                                          text: 'Order Submitted',
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                          alignment: Alignment.center,
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomGeneralButton(
                                          text:'Done',onTap:
                                              () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                barrierDismissible: false,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Column(
        children: [
          Container(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.cartProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        height: 120,
                        width: 120,
                        child: Image.network(
                          controller.cartProducts[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CustomText(
                        text: controller.cartProducts[index].name,
                        fontSize: 14,
                        maxLines: 1,
                      ),
                      CustomText(
                        text:
                        '\$${controller.cartProducts[index].price} x ${controller.cartProducts[index].quantity}',
                        fontSize: 14,
                        color: primaryColor,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 15,
                );
              },
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'TOTAL: ',
                fontSize: 14,
                color: Colors.grey,
              ),
              CustomText(
                text: '\$${controller.totalPrice.toString()}',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}