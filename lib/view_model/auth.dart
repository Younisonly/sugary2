import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/user_model.dart';
import '../helper/Inserting.dart';
import '../widgets/constants.dart';
import 'Controller.dart';

class Auth extends GetxController {
  dynamic email, password, name, OldPassword, NewPassword;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();

  get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    update();
    _user.bindStream(_auth.authStateChanges());
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(const ControlView());
      update();
    } catch (e) {
      Get.snackbar(
        icon: const Icon(Icons.error),
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        UserModel userModel = UserModel(
            email: user.user?.email,
            name: name,
            userId: user.user?.uid);
        await FireStoreUser().addUserToFireStore(userModel);
      });
      Get.offAll(const ControlView());
      update();
    } catch (e) {
      Get.snackbar(
        icon: const Icon(Icons.error),
        'Error registering account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> updateUserData() async {
    try{
      final User? thisUser = _auth.currentUser;
      final String curentEmail= thisUser?.email?? "";
      print(curentEmail);
    AuthCredential credential = EmailAuthProvider.credential(email: curentEmail , password: OldPassword);
    dynamic isDone=await thisUser?.reauthenticateWithCredential(credential);
    await thisUser?.updateEmail(email);
    await thisUser?.updatePassword(NewPassword);
    DocumentReference userRef = _db.collection('Users').doc(thisUser?.uid);
     userRef.update({
      'name': name,
      'email': email,

      // Add any other fields you want to update here
    });
    Get.snackbar(
      icon: const Icon(Icons.done_all, color: primaryColor,),
      "successfully done",
      "Profile has been edited!",
      colorText: primaryColor,
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.offAll(const ControlView());
    update();
    }catch(e){
      Get.snackbar(
        icon: const Icon(Icons.error),
        'Error Editing account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

  }
}
