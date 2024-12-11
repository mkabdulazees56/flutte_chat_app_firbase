// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_chat_app_firebase/components/my_drawer.dart';
// import 'package:flutter_chat_app_firebase/components/user_tile.dart';
// import 'package:flutter_chat_app_firebase/pages/chat_page.dart';
// import 'package:flutter_chat_app_firebase/services/auth/auth_service.dart';
// import 'package:flutter_chat_app_firebase/services/chat/chat_services.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

// //chat and auth services

//   final ChatService _chatService = ChatService();
//   final AuthService _authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('home'),
//       ),
//       drawer: MyDrawer(),
//       body: _buildUserList(),
//     );
//   }

//   // build list of users for the current logged in user
//   Widget _buildUserList() {
//     return StreamBuilder(
//         stream: _chatService.getUsersStream(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text('Error');
//           }
//           //loading
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text('Loading...');
//           }
//           // return list view

//           return ListView(
//             children: snapshot.data!
//                 .map<Widget>(
//                     (userData) => _buildUserListItem(userData, context))
//                 .toList(),
//           );
//         });
//   }

//   Widget _buildUserListItem(
//       Map<String, dynamic> userData, BuildContext context) {
//     if (userData['email'] != _authService.getCurrentUser()!.email) {
//       return UserTile(
//         text: userData['email'],
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ChatPage(
//                         receiverEmail: userData['email'],
//                         receiverID: userData['uid'],
//                       )));
//         },
//       );
//     } else {
//       return Container();
//     }
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_app_firebase/components/my_drawer.dart';
import 'package:flutter_chat_app_firebase/components/user_tile.dart';
import 'package:flutter_chat_app_firebase/pages/chat_page.dart';
import 'package:flutter_chat_app_firebase/services/auth/auth_service.dart';
import 'package:flutter_chat_app_firebase/services/chat/chat_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5,
      ),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _buildUserList(),
      ),
    );
  }

  // Build list of users for the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text('Error loading users',
                  style: TextStyle(color: Colors.red)));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Return list view of users
        return ListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // Build individual user item
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData['email'],
                receiverID: userData['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return SizedBox.shrink(); // Empty widget for the current user
    }
  }
}
