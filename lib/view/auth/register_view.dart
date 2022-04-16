import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(() => LoginScreen());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
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
                CustomText(
                  fontSize: 30,
                  text: "Sign Up,",
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Name",
                  hintText: "adham",
                  onSaved: (value) {
                    controller.name = value;
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
                CustomGeneralButton(
                  text: "SIGN UP",
                  onTap: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      controller.signUpWithEmailAndPassword();
                    }
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
