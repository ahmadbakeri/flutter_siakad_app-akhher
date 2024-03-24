import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/credits/credits_bloc.dart';
import '../../bloc/users/users_bloc.dart';

class UserAuthService {
  static Future<void> checkUserLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!isLoggedIn) {
      // First time login, fetch user data
      context.read<UsersBloc>().add(const UsersEvent.getUser());
      prefs.setBool('isLoggedIn', true); // Update login status
    }
  }
}