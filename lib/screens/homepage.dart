// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/material.dart';
// import 'package:oonzoo/reusable/reusable_wid.dart';
// import 'package:oonzoo/screens/sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomepageState();
// }

// class _HomepageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         iconTheme: IconThemeData(color: Colors.red),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               logoWidget("assests/images/oonzoo.jpg"),
//               SizedBox(
//                 height: 35,
//               ),
//               Text(
//                 "Welcome to Home Screen",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     FirebaseAuth.instance.signOut().then(
//                       (value) async {
//                         SharedPreferences prefs =
//                             await SharedPreferences.getInstance();
//                         prefs.remove('email');
//                         prefs.remove('pass');
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SignInScreen()));
//                       },
//                     );
//                   },
//                   child: Text("Logout"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oonzoo/screens/drawer.dart';
import 'package:oonzoo/screens/sign_in.dart';
import 'package:oonzoo/shopping/screens/mostpopular/most_popular_screen.dart';

import '../shopping/screens/tabbar/tabbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  late String? userId = user!.uid;

  int index = 1;
  final style = TextStyle(color: Colors.black, fontSize: 23);
  final linestyle =
      TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 1000),
          backgroundColor: Colors.black,
          height: 55,
          items: [
            Icon(
              CupertinoIcons.star_fill,
              size: 20,
            ),
            Icon(
              Icons.home,
              size: 20,
            ),
            Icon(
              CupertinoIcons.bars,
              size: 20,
            ),
          ],
          index: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
        body: (index == 0)
            ? MostPopularScreen()
            : (index == 1)
                ? FRTabbarScreen()
                : (index == 2)
                    ? MyDrawer2()
                    : Container());
  }
}
