import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_model.dart';


class UserController {
  late UserModel user;

  void register(BuildContext context) {
    if (user.email == null || user.email!.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter email");
      return;
    }
    if (user.password == null || user.password!.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter password");
      return;
    }
    // You can add more validations here like email format, password strength etc.

    // Register user
    Fluttertoast.showToast(msg: "Registration successful");
    Navigator.pushReplacementNamed(context, "/login");
  }

  void login(BuildContext context) {
    if (user.email == null || user.email!.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter email");
      return;
    }
    if (user.password == null || user.password!.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter password");
      return;
    }
    // You can add more validations here like email format, password strength etc.

    // Login user
    Fluttertoast.showToast(msg: "Login successful");
    Navigator.pushReplacementNamed(context, "/home");
  }

  void logout(BuildContext context) {

    // You can add more validations here like email format, password strength etc.

    // Login user
    Fluttertoast.showToast(msg: "Logout successful");
    Navigator.pushReplacementNamed(context, "/login");
  }
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
}
