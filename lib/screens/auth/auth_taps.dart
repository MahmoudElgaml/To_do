import 'package:flutter/material.dart';
import 'package:to_do/screens/auth/login/login_tap.dart';
import 'package:to_do/screens/auth/signin/signi_tap.dart';
import 'package:to_do/shared/styles/colors.dart';

class AuthTap extends StatelessWidget {
  static const String routrName = "a";

  const AuthTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("login page"),
          bottom: TabBar(
            tabs: [
              Text("Login"),
              Text("Sign in"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginTap(),
            SignTap(),

          ],
        ),
      ),
    );
  }
}
