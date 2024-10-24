import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/comment/add_comment/add_comment_bloc.dart';
import 'package:trashtrack_user/blocs/comment/get_comments/get_comments_bloc.dart';
import 'package:trashtrack_user/blocs/post/get_posts/get_posts_bloc.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/models/comment/comment.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/validators/comment_validator.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_elevated_button.dart';
import 'package:trashtrack_user/widgets/custom_text_field.dart';

class AddCommentPage extends StatefulWidget {
  const AddCommentPage({super.key, required this.post});
  final Post post;

  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();

  void _addComment() {
    final formState = _formKey.currentState;

    if (formState != null) {
      if (formState.validate()) {
        BlocProvider.of<AddCommentBloc>(context).add(
          AddCommentEvent(
            Comment(
              postId: widget.post.id,
              comment: _commentController.text.trim(),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _commentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Comment'),
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
                buildACBC(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocConsumer<AddCommentBloc, AddCommentState> buildACBC() {
    return BlocConsumer<AddCommentBloc, AddCommentState>(
      listener: (BuildContext context, AddCommentState state) {
        if (state is AddCommentSuccessfulState) {
          BlocProvider.of<GetPostsBloc>(context).add(
            GetPostsEvent(),
          );
          BlocProvider.of<GetCommentsBloc>(context).add(
            GetCommentsEvent(widget.post),
          );

          Navigator.pop(context);
        }

        if (state is AddCommentErrorState) {
          MessageDialogHelper.showErrorDialog(
            context,
            'Adding Error',
            state.message,
          );
        }
      },
      builder: (BuildContext context, AddCommentState state) {
        if (state is AddCommentProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return buildAddButton();
        }
      },
    );
  }

  CustomElevatedButton buildAddButton() {
    return CustomElevatedButton(
      onPressed: _addComment,
      isExpanded: true,
      labelText: 'Add',
    );
  }
}
