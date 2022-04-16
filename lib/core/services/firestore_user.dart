import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUsersToFireStore(UserModel userModel) async {
    return await _collectionReference
        .doc(UserModel().userId)
        .set(userModel.toJson());
  }
}
