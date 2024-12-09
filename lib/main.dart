import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/auth/login_or_register.dart';
import 'package:flutter_chat_app_firebase/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: LoginOrRegister(),
    );
  }
}
