import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  List<String> names = <String>[
    "product",
    "product",
    "product",
    "product",
    "product"
  ];
  List<String> images = <String>[
    "assets/images/watch.png",
    "assets/images/watch.png",
    "assets/images/watch.png",
    "assets/images/watch.png",
    "assets/images/watch.png",
  ];
  List<int> prices = <int>[
    100,
    200,
    300,
    400,
    500,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: names[index],
                                fontSize: 24,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text: "\$ ${prices[index].toString()}",
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CustomText(
                                      color: Colors.black,
                                      alignment: Alignment.center,
                                      text: "1",
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        bottom: 20,
                                      ),
                                      child: Icon(
                                        Icons.minimize,
                                        color: Colors.black,
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
                itemCount: names.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
              ),
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
                    CustomText(
                      text: "\$ 2000",
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
                      text: "CHECKOUT",
                      onTap: () {},
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
