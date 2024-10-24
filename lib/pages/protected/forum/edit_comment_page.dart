import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/comment/edit_comment/edit_comment_bloc.dart';
import 'package:trashtrack_user/blocs/comment/get_comments/get_comments_bloc.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/models/comment/comment.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/validators/comment_validator.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_elevated_button.dart';
import 'package:trashtrack_user/widgets/custom_text_field.dart';

class EditCommentPage extends StatefulWidget {
  const EditCommentPage({super.key, required this.comment, required this.post});
  final Comment comment;
  final Post post;

  @override
  State<EditCommentPage> createState() => _EditCommentPageState();
}

class _EditCommentPageState extends State<EditCommentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();

  void _editComment() {
    final formState = _formKey.currentState;

    if (formState != null) {
      if (formState.validate()) {
        BlocProvider.of<EditCommentBloc>(context).add(
          EditCommentEvent(
            widget.comment.copyWith(
              comment: _commentController.text.trim(),
            ),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    _commentController.text = widget.comment.comment ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Comment'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                CustomTextField(
                  textController: _commentController,
                  prefixIcon: Icons.forum,
                  labelText: 'Comment',
                  onPressed: () => _commentController.clear(),
                  suffixIcon: Icons.clear,
                  validator: commentValidator,
                  maxLines: 5,
                ),
                const SizedBox(height: 25),
                buildECBC(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocConsumer<EditCommentBloc, EditCommentState> buildECBC() {
    return BlocConsumer<EditCommentBloc, EditCommentState>(
      listener: (BuildContext context, EditCommentState state) {
        if (state is EditCommentSuccessfulState) {
          BlocProvider.of<GetCommentsBloc>(context).add(
            GetCommentsEvent(widget.post),
          );

          Navigator.pop(context);
        }

        if (state is EditCommentErrorState) {
          MessageDialogHelper.showErrorDialog(
            context,
            'Editing Error',
            state.message,
          );
        }
      },
      builder: (BuildContext context, EditCommentState state) {
        if (state is EditCommentProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return buildEditButton();
        }
      },
    );
  }

  CustomElevatedButton buildEditButton() {
    return CustomElevatedButton(
      onPressed: _editComment,
      isExpanded: true,
      labelText: 'Edit',
    );
  }
}
