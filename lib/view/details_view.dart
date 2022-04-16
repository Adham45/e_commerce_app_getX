import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, this.productModel}) : super(key: key);
  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 270,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                productModel!.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel!.name,
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: "Size",
                                ),
                                CustomText(
                                  text: productModel!.size,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: "Color",
                                ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: productModel!.color,
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "Details",
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: productModel!.description,
                        fontSize: 18,
                        height: 2,
                        maxLines: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "PRICE",
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: "\$" + productModel!.price,
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 100,
                    width: 180,
                    child: CustomGeneralButton(
                      text: "Add",
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
