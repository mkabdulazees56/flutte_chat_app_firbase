// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/components/my_button.dart';
import 'package:flutter_chat_app_firebase/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // on tap go to the register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login method
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 50,
            ),
            Text('Welcome back, you have been missed!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 20,
            ),
            //Email Address
            MyTextField(
              hintText: "Email",
              obscuredText: false,
              controller: _emailController,
            ),
            SizedBox(
              height: 20,
            ),
            //Password
            MyTextField(
              hintText: 'Password',
              obscuredText: true,
              controller: _passwordController,
            ),
            SizedBox(
              height: 25,
            ),
            //Login Button
            MyButton(
              buttonText: "Login",
              onTap: login,
            ),
            SizedBox(
              height: 25,
            ),
            //register Button
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Don\'t have an account? ',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text('Register Now',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
