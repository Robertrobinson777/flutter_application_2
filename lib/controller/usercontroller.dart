import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/user_model.dart';
import 'package:flutter_application_2/services/user_service.dart';

class UserController extends ChangeNotifier {
  UserService userService = UserService();

  UserDetails? userDetails;

  Future<void> getUserDetails() async {
    userDetails = await userService.getUserDetails();
    notifyListeners();
  }
}
