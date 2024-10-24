import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:trashtrack_user/blocs/auth/login/login_bloc.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'terms_page.dart'; // Import the modal

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final bool _isTermsAccepted = false;

  void _signinAuthAccount(BuildContext context) {
    if (_isTermsAccepted) {
      BlocProvider.of<LoginBloc>(context).add(LoginAccountEvent());
    } else {
      // Show the terms and conditions modal
      TermsPageModal.showTermsModal(
        context,
        () {
          // When terms are accepted
          Navigator.pop(context); // Close the modal
          BlocProvider.of<LoginBloc>(context).add(LoginAccountEvent());
        },
        () {
          // When terms are denied
          Navigator.pop(context); // Close the modal
          // You can delete the account or perform other actions here
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double fixedBackgroundHeight = 450.0;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: fixedBackgroundHeight,
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 80),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Image.asset(
                        'lib/assets/images/logo-trashtrack.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'TrashTrack',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Color(0xFF84CF0F), Color(0xFF00993D)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                      fontFamily: 'Lalezar',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Please sign in to continue',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  buildLoginBC(context),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BlocConsumer buildLoginBC(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          MessageDialogHelper.showErrorDialog(
            context,
            'Login Error',
            state.message,
          );
        }
      },
      builder: (context, state) {
        if (state is LoginProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return buildLoginButton(context);
        }
      },
    );
  }

  SignInButton buildLoginButton(BuildContext context) {
    return SignInButton(
      onPressed: () => _signinAuthAccount(context),
      text: "Login and Register",
      Buttons.google,
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF02413C)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.7)
      ..quadraticBezierTo(
          size.width / 2, size.height * 0.8, size.width, size.height * 0.7)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// import 'package:flutter/material.dart'; STABLE
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sign_in_button/sign_in_button.dart';
// import 'package:trashtrack_user/blocs/auth/login/login_bloc.dart';
// import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
// import 'package:trashtrack_user/pages/forgot_page.dart';
// import 'package:trashtrack_user/widgets/custom_app_bar.dart';
// import 'package:trashtrack_user/widgets/custom_elevated_button.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
  
//   void _signinAuthAccount(BuildContext context) {
//     BlocProvider.of<LoginBloc>(context).add(LoginAccountEvent());
//   }

//   // void _gotoForgotPage(BuildContext context) {
//   //   Navigator.push(
//   //     context,
//   //     MaterialPageRoute(
//   //       builder: (BuildContext context) => const ForgotPage(),
//   //     ),
//   //   );
//   // }
// final bool _isTermsAccepted = false; // Track if terms are accepted
//   @override
//   Widget build(BuildContext context) {
//     const double fixedBackgroundHeight = 450.0;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             height: fixedBackgroundHeight,
//             child: CustomPaint(
//               painter: BackgroundPainter(),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   const SizedBox(height: 80),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Center(
//                       child: Image.asset(
//                         'lib/assets/images/logo-trashtrack.png',
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'TrashTrack',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       foreground: Paint()
//                         ..shader = const LinearGradient(
//                           colors: [Color(0xFF84CF0F), Color(0xFF00993D)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
//                       fontFamily: 'Lalezar',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Please sign in to continue',
//                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                           color: Colors.grey[600],
//                         ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 40),
//                   buildLoginBC(),
//                   const SizedBox(height: 25),
//                   // CustomElevatedButton(
//                   //   onPressed: () => _gotoForgotPage(context),
//                   //   isExpanded: true,
//                   //   labelText: 'Forgot',
//                   //   backgroundColor: Colors.orange,
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   BlocConsumer buildLoginBC() {
//     return BlocConsumer<LoginBloc, LoginState>(
//       listener: (context, state) {
//         if (state is LoginErrorState) {
//           MessageDialogHelper.showErrorDialog(
//             context,
//             'Login Error',
//             state.message,
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is LoginProcessingState) {
//           return const CircularProgressIndicator();
//         } else {
//           return buildLoginButton(context);
//         }
//       },
//     );
//   }

//   // CustomElevatedButton buildLoginButton(BuildContext context) {
//   //   return CustomElevatedButton(
//   //     onPressed: () => _signinAuthAccount(context),
//   //     isExpanded: true,
//   //     labelText: 'Signin with Google',
//   //   );
//   // }
//   SignInButton buildLoginButton(BuildContext context) {
//     return SignInButton(
//       onPressed: () => _signinAuthAccount(context),
//       text: "Login and Register",
//       Buttons.google,
//     );
//   }
// }

// class BackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFF02413C)
//       ..style = PaintingStyle.fill;

//     final path = Path()
//       ..moveTo(0, 0)
//       ..lineTo(0, size.height * 0.7)
//       ..quadraticBezierTo(
//           size.width / 2, size.height * 0.8, size.width, size.height * 0.7)
//       ..lineTo(size.width, 0)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
