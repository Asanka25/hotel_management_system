import 'package:flutter/material.dart';
import 'package:hotel_management_system/services/auth.dart';

class Manager extends StatelessWidget {
  final AuthService _auth = AuthService();
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Manager'),
        backgroundColor: Colors.white,
        elevation: 1.5,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Center(child: Text("manager")),
    );
  }
}
