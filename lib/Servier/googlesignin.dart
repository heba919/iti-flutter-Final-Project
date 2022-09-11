// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// abstract class GoogleAuthbase {
//   User get currentUser;

//   Future<User> signInWithGoogle();

//   Future<void> signOutWithGoogle();

//   Stream<User> authstateChange();
// }

// class GooglesignIn implements GoogleAuthbase {
//   User get currentUser => _firebaseAuth.currentUser;
//   final _firebaseAuth = FirebaseAuth.instance;

//   @override
//   Stream<User> authstateChange() => _firebaseAuth.authStateChanges();

//   @override
//   Future<User> signInWithGoogle() async {
//     final googleSignin = GoogleSignIn();
//     final googleuser = await googleSignin.signIn();

//     if (googleuser != null) {
//       final googleAuth = await googleuser.authentication;
//       if (googleAuth.idToken != null) {
//         final userCredential = await _firebaseAuth
//             .signInWithCredential(GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         ));
//         return userCredential.user;
//       } else {
//         throw FirebaseAuthException(
//             message: "missing idtoken google", code: "Error about id token");
//       }
//     } else {
//       throw FirebaseAuthException(message: 'Sign In Canceled', code: 'Error');
//     }
//   }

//   @override
//   Future<void> signOutWithGoogle() async {
//     final googlesignin = GoogleSignIn();
//     await googlesignin.signOut();
//     await _firebaseAuth.signOut();
//   }
// }
