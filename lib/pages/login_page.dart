// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            ),
            SizedBox(
              height: 20,
            ),
            //Password
            MyTextField(
              hintText: 'Password',
              obscuredText: true,
            )
          ],
        ),
      ),
    );
  }
}
