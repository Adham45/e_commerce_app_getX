import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/view_model/profile_view_model.dart';

import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/auth_view_model.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/images/Avatar.png'),
                              foregroundImage: controller.currentUser!.pic !=
                                      'default'
                                  ? NetworkImage(controller.currentUser!.pic)
                                  : null,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.currentUser!.name,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: controller.currentUser!.email,
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      ProfileIconWidget(
                        text: "Edit Profile",
                        image: "assets/images/Icon_Edit-Profile.png",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileIconWidget(
                        text: "Shopping Address",
                        image: "assets/images/Icon_Location.png",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileIconWidget(
                        text: "Order History",
                        image: "assets/images/Icon_History.png",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileIconWidget(
                        text: "Cards",
                        image: "assets/images/Icon_Payment.png",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileIconWidget(
                        text: "Notifications",
                        image: "assets/images/Icon_Alert.png",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileIconWidget(
                        text: "LogOut",
                        image: "assets/images/Icon_Exit.png",
                        onTap: () {
                          Get.find<AuthViewModel>().signOut();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({
    Key? key,
    required this.text,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0.0),
      ),
      onPressed: onTap,
      child: ListTile(
        title: CustomText(
          text: text,
        ),
        leading: Image.asset(image),
        trailing: Icon(
          Icons.navigate_next,
          color: Colors.black,
        ),
      ),
    );
  }
}
