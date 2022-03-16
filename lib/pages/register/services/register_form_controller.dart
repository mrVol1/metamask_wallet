import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metamask_app/pages/register/create_a_new_wallet_form.dart';

class AurhServices {
  String? errorMessage;
  final FirebaseAuth _loginAndRegister = FirebaseAuth.instance;

  Future signUp(BuildContext context, String email, String password) async {
    try {
      await _loginAndRegister
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateWalletScreen(),
                  ),
                  (Route<dynamic> route) => false,
                ),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Your email address appears to be malformed.';
          break;
        case 'wrong-password':
          errorMessage = 'Your password is wrong.';
          break;
        case 'user-not-found':
          errorMessage = "User with this email doesn't exist.";
          break;
        case 'user-disabled':
          errorMessage = 'User with this email has been disabled.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many requests';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Signing in with Email and Password is not enabled.';
          break;
        default:
          errorMessage = 'An undefined Error happened.';
      }
    }
  }
}
