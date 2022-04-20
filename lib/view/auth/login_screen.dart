import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/register_view.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      fontSize: 30,
                      text: "Welcome,",
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      },
                      child: CustomText(
                        fontSize: 18,
                        color: primaryColor,
                        text: "Sign Up",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Sign in to continue",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Email",
                  hintText: "example@gmail.com",
                  onSaved: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      if (kDebugMode) {
                        print("Error");
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Password",
                  hintText: "***********",
                  onSaved: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      if (kDebugMode) {
                        print("Error");
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Forget Password?",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomGeneralButton(
                  text: "SIGN IN",
                  onTap: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "-OR-",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonWithIcon(
                  text: "Log In With Facebook",
                  onTap: () {
                    controller.signInWithFacebookAccount();
                  },
                  iconData: FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonWithIcon(
                  text: "Log In With Google",
                  onTap: () {
                    controller.signInWithGoogleAccount();
                  },
                  iconData: FontAwesomeIcons.googlePlusG,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
