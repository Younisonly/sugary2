import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/auth.dart';
import 'login_screen.dart';


class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Auth>(
        init: Auth(),
        builder: (controller)=>Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.pink],
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.name = value;
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.email = value;
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.password = value;
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      controller.createUserWithEmailAndPassword();}},

                  child: Text('Register'),
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),

    )) ;
  }
}




// class RegisterScreen extends GetWidget<Auth> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// var email, name, password;
//   RegisterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           leading: GestureDetector(
//               onTap: () {
//                 Get.off(LoginScreen());
//               },
//               child: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               )),
//           backgroundColor: Colors.white,
//         ),
//         body:GetBuilder<Auth>(
//           init: Auth(),
//           builder: (controller)=> ListView(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.only(top: 35, right: 30, left: 30),
//                 child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         const CustomText(
//                           text: "Sign Up,",
//                           fontSize: 35,
//                           color: Colors.black,
//                         ),
//                         const SizedBox(
//                           height: 70,
//                         ),
//                         CustomText(
//                           text: "Name",
//                           fontSize: 14,
//                           color: Colors.grey.shade900,
//                         ),
//                         TextFormField(
//                           onSaved: (value) => {controller.name = value},
//                           decoration: const InputDecoration(
//                             icon: Icon(Icons.person, color: Colors.deepPurple,),
//                             hintText: "My Name",
//                             hintStyle: TextStyle(
//                               color: Colors.grey,),
//                             fillColor: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 60,
//                         ),
//                         CustomText(
//                           text: "Email",
//                           fontSize: 14,
//                           color: Colors.grey.shade900,
//                         ),
//                         TextFormField(
//                           onSaved: (value) => {controller.email = value},
//                           decoration: const InputDecoration(
//                             icon: Icon(Icons.email, color: Colors.deepPurple,),
//                             hintText: "example@gmail.com",
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                             ),
//                             fillColor: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 60,
//                         ),
//                         CustomText(
//                           text: "password",
//                           fontSize: 14,
//                           color: Colors.grey.shade900,
//                         ),
//                         TextFormField(
//                           onSaved: (value) => {controller.password = value},
//                           decoration: const InputDecoration(
//                             icon: Icon(Icons.lock, color: Colors.deepPurple,),
//                             hintText: "*******",
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                             ),
//                             fillColor: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 90),
//                         TextButton(
//                           onPressed: () {
//                             _formKey.currentState?.save();
//                             if (_formKey.currentState!.validate()) {
//                             controller.createUserWithEmailAndPassword();}
//                             },
//                           style: TextButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(9.0)),
//                             alignment: Alignment.center,
//                             backgroundColor: primaryColor,
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.only(
//                                 top: 7, right: 80, left: 80, bottom: 7),
//                             child: CustomText(
//                                 color: Colors.white,
//                                 alignment: Alignment.center,
//                                 fontSize: 18,
//                                 text: "sign up"),
//                           ),
//                         ),
//                       ],
//                     )))
//           ],
//         )));
//   }
// }
