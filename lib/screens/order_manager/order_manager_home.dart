import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/user/user.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/models/user/user.dart';


class OrderManagerHome extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    List<Object> _list = [
       {'id':21,'name':"asamka"},
       {'id':21,'name':"asamka"},
       {'id':21,'name':"asamka"}
    ];
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order manager'),
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
      body: GridView.count(
        padding: EdgeInsets.all(15.0),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        children: _list.map<Object>((value) {
          return Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            // child: Text(Object.fromMap(value)),
          );
        }).toList(),
      ),
    );
  }
}
