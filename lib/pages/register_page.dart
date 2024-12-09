// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/components/my_button.dart';
import 'package:flutter_chat_app_firebase/components/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  RegisterPage({super.key});
  // register method
  void register() {}

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
            Text('Lets create an account for you',
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
              height: 20,
            ),
            MyTextField(
              hintText: 'Confirm Password',
              obscuredText: true,
              controller: _passwordController,
            ),
            SizedBox(
              height: 25,
            ),
            //Login Button
            MyButton(
              buttonText: "Register",
              onTap: register,
            ),
            SizedBox(
              height: 25,
            ),
            //register Button
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Already have an account? ',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              Text('Login Now',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold)),
            ])
          ],
        ),
      ),
    );
  }
}
