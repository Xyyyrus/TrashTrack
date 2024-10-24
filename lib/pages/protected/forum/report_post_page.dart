import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/post/report_post/report_post_bloc.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/models/report/report.dart';
import 'package:trashtrack_user/validators/reason_validator.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_elevated_button.dart';
import 'package:trashtrack_user/widgets/custom_text_field.dart';

class ReportPostPage extends StatefulWidget {
  const ReportPostPage({super.key, required this.post});
  final Post post;

  @override
  State<ReportPostPage> createState() => _ReportPostPageState();
}

class _ReportPostPageState extends State<ReportPostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _reasonController = TextEditingController();

  void _reportPost() {
    final formState = _formKey.currentState;

    if (formState != null) {
      if (formState.validate()) {
        BlocProvider.of<ReportPostBloc>(context).add(
          ReportPostEvent(
            Report(
              postId: widget.post.id,
              reason: _reasonController.text.trim(),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Report Post'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                CustomTextField(
                  textController: _reasonController,
                  prefixIcon: Icons.edit_document,
                  labelText: 'Reason',
                  onPressed: () => _reasonController.clear(),
                  suffixIcon: Icons.clear,
                  validator: reasonValidator,
                  maxLines: 5,
                ),
                const SizedBox(height: 25),
                buildRPBC(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocConsumer<ReportPostBloc, ReportPostState> buildRPBC() {
    return BlocConsumer<ReportPostBloc, ReportPostState>(
      listener: (BuildContext context, ReportPostState state) {
        if (state is ReportPostSuccessfulState) {
          MessageDialogHelper.showSuccessDialog(
            context,
            'Report Successful',
            'Post successfully reported',
          );
        }

        if (state is ReportPostErrorState) {
          MessageDialogHelper.showErrorDialog(
            context,
            'Reporting Error',
            state.message,
          );
        }
      },
      builder: (BuildContext context, ReportPostState state) {
        if (state is ReportPostProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return buildReportButton();
        }
      },
    );
  }

  CustomElevatedButton buildReportButton() {
    return CustomElevatedButton(
      onPressed: _reportPost,
      isExpanded: true,
      labelText: 'Report',
      backgroundColor: Colors.red,
    );
  }
}
