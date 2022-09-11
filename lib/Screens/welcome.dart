import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'BottomBar.dart';

class Welcome extends StatefulWidget {
  // Welcome({@required this.auth});

  // final GoogleAuthbase auth;

  // Future<void> Signinwithgoogle() async {
  //   try {
  //     await auth.signInWithGoogle();
  //   } catch (ex) {}
  // }
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/c3/b4/81/c3b481f7175c75fe4e91af4b1cb15820.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // alignment: Alignment.topLeft,
          //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: [
            //be ....
            Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 100, height: 200),
                  Text(
                    "Be",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20, height: 100),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: Duration(milliseconds: 100),
                      animatedTexts: [
                        RotateAnimatedText("AWESOME",
                            textStyle: TextStyle(
                              fontSize: 19,
                              height: 2,
                              color: Colors.white,
                              backgroundColor: Colors.black12,
                              letterSpacing: 5,
                            )),
                        RotateAnimatedText("OPTIMISTIC",
                            textStyle: TextStyle(
                              fontSize: 19,
                              height: 2,
                              color: Colors.white,
                              backgroundColor: Colors.black12,
                              letterSpacing: 5,
                            )),
                        RotateAnimatedText("DIFFERENT",
                            textStyle: TextStyle(
                              fontSize: 19,
                              height: 2,
                              color: Colors.white,
                              backgroundColor: Colors.black12,
                              letterSpacing: 5,
                            )),
                      ],
                    ),
                  ),
                ]),
            //welcome
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome! To Deezer",
                    style:
                        // GoogleFonts.lato(
                        //   textStyle:
                        TextStyle(
                      // backgroundColor: Colors.white10.withOpacity(0.1),
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                    //)
                  ),
                ]),
            //Log in
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  "Log In With:",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            SizedBox(width: 90, height: 30),
            //Icons
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //facebook
              Ink(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => BottomBarScreen())));
                      },
                      child: CircleAvatar(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white12.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://img.icons8.com/glyph-neue/2x/facebook-circled.png",
                              ),
                            ),
                          ),
                        ),
                      ))),

              SizedBox(width: 70),

              //google
              Ink(
                  child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => BottomBarScreen())));
                },
                child: CircleAvatar(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://img.icons8.com/ios-filled/2x/google-plus-circled.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ))
            ]),
          ],
        ),
      ),
    ));
    // } else {
    //   return home(
    //       user.displayName,
    //       user.email,
    //       GoogleUserCircleAvatar(
    //         identity: user,
    //       ),
    //       _googleSignIn);
    // }
  }
}
