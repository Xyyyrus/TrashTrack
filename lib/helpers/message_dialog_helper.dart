import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class MessageDialogHelper {
  static Future<dynamic> showErrorDialog(
    BuildContext context,
    String title,
    String? desc,
  ) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
    ).show();
  }

  static Future<dynamic> showSuccessDialog(
    BuildContext context,
    String title,
    String? desc,
  ) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
    ).show();
  }

  static Future<dynamic> showNoticeDialog(
    BuildContext context,
    String title,
    String? desc,
    void Function()? action,
  ) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      title: title,
      desc: desc,
      btnOkOnPress: action,
      btnCancelOnPress: () {},
    ).show();
  }
}
