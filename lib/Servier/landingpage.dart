// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Screen/Welcome.dart';
// import 'package:flutter_application_1/Screen/home.dart';

// import 'googlesignin.dart';

// class Landing extends StatefulWidget {
//   final GoogleAuthbase auth;

//   Landing({@required this.auth});
//   @override
//   State<Landing> createState() => _LandingState();
// }

// class _LandingState extends State<Landing> {
//   User _user;

//   @override
//   void initState() {
//     super.initState();
//     widget.auth.authstateChange().listen((user) {});
//     updatauser(widget.auth.currentUser);
//   }

//   void updatauser(User user) {
//     print('${user.uid}');
//     setState(() {
//       _user = user;
//     });
//   }

// //  @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User>(
//         stream: widget.auth.authstateChange(),
//        // initialData: ,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             final User user = snapshot.data;

//             if (user == null) {
//               return Welcome(
//                 auth: widget.auth,
//               );
//             }
//             return home(

//               auth: widget.auth,
//             );
//           }
//           return Scaffold(body: Center(child: CircularProgressIndicator()));
//         });
//   }
// }
