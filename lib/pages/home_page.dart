// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/components/my_drawer.dart';
import 'package:flutter_chat_app_firebase/components/user_tile.dart';
import 'package:flutter_chat_app_firebase/pages/chat_page.dart';
import 'package:flutter_chat_app_firebase/services/auth/auth_service.dart';
import 'package:flutter_chat_app_firebase/services/chat/chat_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build list of users for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          // return list view

          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
      text: userData['email'],
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatPage(
                      receiverEmail: userData['email'],
                    )));
      },
    );
  }
}
