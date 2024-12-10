import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    // get auth services
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('home'),
      actions: [
        IconButton(icon: Icon(Icons.logout), onPressed: logout),
      ],
    ));
  }
}
