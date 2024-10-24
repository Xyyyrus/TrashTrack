import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/sources/auth/forgot_source.dart';
import 'package:trashtrack_user/data/sources/auth/login_source.dart';
import 'package:trashtrack_user/data/sources/auth/logout_source.dart';
import 'package:trashtrack_user/models/credential/credential.dart';

typedef FESST = Future<Either<String, String>>;

class AuthRepository {
  LoginSource loginSource;
  LogoutSource logoutSource;
  ForgotSource forgotSource;

  AuthRepository({
    required this.loginSource,
    required this.logoutSource,
    required this.forgotSource,
  });

  FESST login() async {
    return await loginSource.login();
  }

  FESST logout() async {
    return await logoutSource.logout();
  }

  FESST forgot(Credential credential) async {
    return await forgotSource.forgot(credential);
  }
}
