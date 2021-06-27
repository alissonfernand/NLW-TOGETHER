import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUserSharedPreferences(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/home', arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUserSharedPreferences(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString('@PayFlowUser', user.toJson());
  }

  Future<void> currentUserSharedPreferences(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));

    if (instance.containsKey('@PayFlowUser')) {
      final json = await instance.get('@PayFlowUser') as String;
      setUser(context, UserModel.fromJson(json));
    } else {
      setUser(context, null);
    }
  }
}
