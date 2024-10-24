import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';
import 'package:trashtrack_user/models/credential/credential.dart';

class ForgotSource {
  FESST forgot(Credential credential) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      await firebaseAuth.sendPasswordResetEmail(email: credential.email);

      return const Right('Email sent');
    } catch (e) {
      String error = 'Error sending email: $e';

      return Left(error);
    }
  }
}
