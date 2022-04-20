import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/view_model/control_view_model.dart';

class ControlView extends GetWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentState,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controller) => BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                "assets/images/explore.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Explore"),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                "assets/images/cart.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Cart"),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                "assets/images/person.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Person"),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
