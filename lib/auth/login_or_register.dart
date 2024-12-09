import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/pages/login_page.dart';
import 'package:flutter_chat_app_firebase/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void _togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: _togglePage,
      );
    } else {
      return RegisterPage(
        onTap: _togglePage,
      );
    }
  }
}
