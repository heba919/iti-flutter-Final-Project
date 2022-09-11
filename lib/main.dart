import 'package:flutter/material.dart';
import 'package:movie_app/Screens/welcome.dart';
import 'package:provider/provider.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'Landing/googlesignin.dart';
//import 'Landing/landingpage.dart';

import 'Servier/FavProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  // FirebaseAuth.instance
  // .authStateChanges()
  // .listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User is signed in!');
  //   }
  // });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: ((context) => FavProvider()),
        child: MaterialApp(
            title: ' Deezer music',
            theme: ThemeData.dark(),
            home: Welcome(),
            debugShowCheckedModeBanner: false));
  }
}
