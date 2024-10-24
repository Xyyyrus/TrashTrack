import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';

class LogoutSource {
  FESST logout() async {
    final firebaseAuth = FirebaseAuth.instance;
    final googleSignin = GoogleSignIn();

    try {
      await googleSignin.signOut();
      await firebaseAuth.signOut();

      return const Right('Logout successful');
    } catch (e) {
      String error = 'Error signing out: $e';

      return Left(error);
    }
  }
}
