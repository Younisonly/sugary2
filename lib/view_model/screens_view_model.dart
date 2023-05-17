import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../view/add.dart';
import '../widgets/constants.dart';
class ScreenViewModel extends GetxController {
  ScreenViewModel(){
    getUserInfo();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String Type = '';
  late String email='';
  Map<dynamic, dynamic> UserInfo = {};



  getUserInfo() {
    update();
    final User? user = _auth.currentUser;
    FirebaseFirestore.instance.collection('Users').where(
        'email', isEqualTo: user?.email).get().then((value) {
      UserInfo = value.docs[0].data();
      Type = UserInfo['type'].toString();
       email = UserInfo['email'].toString();
      if (UserInfo['type'].toString() == '0') {
        Type = 'user';
      }
      else if (UserInfo['type'].toString() == '1') {
        Type = 'Admin';
      }
      return;
    });
  }

  Widget setWidget(page){
    if (Type == 'Admin') {
      return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: primaryColor,
        overlayOpacity: 0.5,
        overlayColor: Colors.black ,
animationSpeed: 250,
        children: [
          SpeedDialChild(
            child: Icon(Icons.production_quantity_limits_outlined, color: Colors.white,),
            label: "Add products",
            backgroundColor: Colors.purpleAccent,
            onTap: (){
              // Get.to(AddProduct());
            }

          ),
          SpeedDialChild(
              child: Icon(Icons.category,color: Colors.white),
              label: "Add Category",
              backgroundColor: Colors.purpleAccent,
              onTap: (){
                // Get.toAddCategory());
              }
          )
        ],
      );
    }
    else{
    return Container();}
  }
}
