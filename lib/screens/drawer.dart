import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oonzoo/screens/homepage.dart';
import 'package:oonzoo/screens/sign_in.dart';

class MyDrawer2 extends StatefulWidget {
  @override
  State<MyDrawer2> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer2> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.black12,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.orange.shade600),
            margin: EdgeInsets.zero,
            accountName: Text("OONZOO",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            accountEmail: Text(
              "${FirebaseAuth.instance.currentUser!.email}",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.logout),
                    label: Text("Logout"))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
