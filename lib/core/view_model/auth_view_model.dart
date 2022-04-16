import 'package:e_commerce_app/core/services/firestore_user.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? _userData;
  late String email, password, name;
  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) async {
      saveUser(user);
      Get.offAll(HomeScreen());
    });
  }

  Future<void> facebookSignInMethod() async {
    final LoginResult loginResult =
        await FacebookAuth.instance.login(permissions: ['email']);
    if (loginResult == LoginStatus.success) {
      final userData = FacebookAuth.instance.getUserData();
      _userData = userData as Map<String, dynamic>?;
    } else {
      print(loginResult.message);
    }
    final OAuthCredential oAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance
        .signInWithCredential(oAuthCredential)
        .then((user) async {
      saveUser(user);
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar(
        "Error Login Account",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar(
        "Error Login Account",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUsersToFireStore(
      UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: name == null ? user.user!.displayName : name,
        pic: '',
      ),
    );
  }
}
