import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/auth/forgot/forgot_bloc.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/models/credential/credential.dart';
import 'package:trashtrack_user/validators/email_validator.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_elevated_button.dart';
import 'package:trashtrack_user/widgets/custom_text_field.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _forgotAuthAccount() {
    FormState? formState = _formKey.currentState;

    if (formState != null) {
      if (formState.validate()) {
        BlocProvider.of<ForgotBloc>(context).add(
          ForgotAccountEvent(
            Credential(email: _emailController.text.trim()),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Forgot'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CustomTextField(
                  textController: _emailController,
                  prefixIcon: Icons.email,
                  labelText: 'Email',
                  onPressed: () => _emailController.clear(),
                  suffixIcon: Icons.clear,
                  validator: emailValidator,
                ),
                const SizedBox(height: 25),
                buildForgotBC(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocConsumer buildForgotBC() {
    return BlocConsumer<ForgotBloc, ForgotState>(
      listener: (context, state) {
        if (state is ForgotSuccessfulState) {
          _emailController.clear();

          MessageDialogHelper.showSuccessDialog(
            context,
            'Forgot Success',
            state.message,
          );
        }

        if (state is ForgotErrorState) {
          MessageDialogHelper.showErrorDialog(
            context,
            'Forgot Error',
            state.message,
          );
        }
      },
      builder: (context, state) {
        if (state is ForgotProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return buildForgotButton();
        }
      },
    );
  }

  CustomElevatedButton buildForgotButton() {
    return CustomElevatedButton(
      onPressed: _forgotAuthAccount,
      isExpanded: true,
      labelText: 'Forgot',
    );
  }
}
