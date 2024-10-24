import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/comment/delete_comment/delete_comment_bloc.dart';
import 'package:trashtrack_user/blocs/comment/get_comments/get_comments_bloc.dart';
import 'package:trashtrack_user/blocs/post/delete_post/delete_post_bloc.dart';
import 'package:trashtrack_user/blocs/post/edit_post/edit_post_bloc.dart';
import 'package:trashtrack_user/blocs/post/get_posts/get_posts_bloc.dart';
import 'package:trashtrack_user/extensions/timestamp_formatter.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/models/comment/comment.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/pages/protected/forum/add_comment_page.dart';
import 'package:trashtrack_user/pages/protected/forum/edit_comment_page.dart';
import 'package:trashtrack_user/pages/protected/forum/edit_post_page.dart';
import 'package:trashtrack_user/pages/protected/forum/report_post_page.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_cached_image.dart';

class PostInformationPage extends StatelessWidget {
  const PostInformationPage({super.key, required this.post});
  final Post post;

  void _getPosts(BuildContext context) {
    BlocProvider.of<GetPostsBloc>(context).add(
      GetPostsEvent(),
    );
  }

  Future<void> _deletePost(BuildContext context, Post post) async {
    await MessageDialogHelper.showNoticeDialog(
      context,
      'Record Deletion',
      'Are you sure you want to delete this record?',
      () {
        BlocProvider.of<DeletePostBloc>(context).add(
          DeletePostEvent(post),
        );
      },
    );
  }

  void _getComments(BuildContext context) {
    BlocProvider.of<GetCommentsBloc>(context).add(
      GetCommentsEvent(post),
    );
  }

  Future<void> _deleteComment(BuildContext context, Comment comment) async {
    await MessageDialogHelper.showNoticeDialog(
      context,
      'Record Deletion',
      'Are you sure you want to delete this record?',
      () {
        BlocProvider.of<DeleteCommentBloc>(context).add(
          DeleteCommentEvent(comment),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _getComments(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Post Information'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildPostHeaderRow(context),
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(post.body),
            const SizedBox(height: 8),
            buildImageCacheNI(),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            Expanded(
              child: buildGetCommentsBB(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => AddCommentPage(
              post: post,
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Row buildPostHeaderRow(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.author ?? 'User',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              post.createdAt?.toFormattedDate() ?? 'Error date',
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            if (uid == post.uid)
              buildPostActionsRow(context, post)
            else
              buildReportPostIB(context, post),
          ],
        ),
      ],
    );
  }

  Row buildPostActionsRow(BuildContext context, Post post) {
    return Row(
      children: <Widget>[
        buildEditPostBL(context, post),
        buildDeletePostBC(post),
      ],
    );
  }

  BlocListener<EditPostBloc, EditPostState> buildEditPostBL(
    BuildContext context,
    Post post,
  ) {
    return BlocListener<EditPostBloc, EditPostState>(
      listener: (BuildContext context, EditPostState state) {
        if (state is EditPostSuccessfulState) {
          Navigator.pop(context);
        }
      },
      child: buildEditPostIB(context, post),
    );
  }

  IconButton buildEditPostIB(BuildContext context, Post post) {
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.blue, size: 25),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => EditPostPage(post: post),
        ),
      ),
    );
  }

  BlocConsumer<DeletePostBloc, DeletePostState> buildDeletePostBC(Post post) {
    return BlocConsumer<DeletePostBloc, DeletePostState>(
      listener: (BuildContext context, DeletePostState state) {
        if (state is DeletePostSuccessfulState) {
          _getPosts(context);
        }
      },
      builder: (BuildContext context, DeletePostState state) {
        if (state is DeletePostProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return IconButton(
            icon: const Icon(Icons.delete, color: Colors.red, size: 25),
            onPressed: () => _deletePost(context, post),
          );
        }
      },
    );
  }

  IconButton buildReportPostIB(BuildContext context, Post post) {
    return IconButton(
      icon: const Icon(Icons.report, color: Colors.orange, size: 25),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ReportPostPage(post: post),
        ),
      ),
    );
  }

  Widget buildImageCacheNI() {
    String? url = post.url;
    Widget widget = Container();

    if (url != null && url.isNotEmpty) {
      widget = Padding(
        padding: const EdgeInsets.only(top: 5),
        child: CustomCachedImage(
          url: url,
          width: double.maxFinite,
          fit: BoxFit.fill,
          height: 200,
        ),
      );
    }

    return widget;
  }

  BlocBuilder<GetCommentsBloc, GetCommentsState> buildGetCommentsBB() {
    return BlocBuilder<GetCommentsBloc, GetCommentsState>(
      builder: (BuildContext context, GetCommentsState state) {
        if (state is GetCommentsSuccessfulState) {
          final comments = state.comments;

          if (comments.isNotEmpty) {
            return buildAllCommentsLB(comments);
          } else {
            return const Center(
              child: Text(
                'No comment yet',
                style: TextStyle(fontSize: 17),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView buildAllCommentsLB(List<Comment> comments) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (BuildContext context, int index) {
        Comment comment = comments[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: builActualCommentCard(context, comment),
        );
      },
    );
  }

  Card builActualCommentCard(BuildContext context, Comment comment) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildCommentHeaderRow(context, comment),
            Text(
              comment.comment ?? '',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildCommentHeaderRow(BuildContext context, Comment comment) {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              comment.author ?? 'User',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              comment.createdAt?.toFormattedDate() ?? 'Error date',
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        if (uid == comment.uid) buildCommentActionsRow(context, comment),
      ],
    );
  }

  Row buildCommentActionsRow(BuildContext context, Comment comment) {
    return Row(
      children: <Widget>[
        buildEditCommentIB(context, comment),
        buildDeleteCommentBC(comment)
      ],
    );
  }

  IconButton buildEditCommentIB(BuildContext context, Comment comment) {
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.blue, size: 25),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => EditCommentPage(
            comment: comment,
            post: post,
          ),
        ),
      ),
    );
  }

  BlocConsumer<DeleteCommentBloc, DeleteCommentState> buildDeleteCommentBC(
    Comment comment,
  ) {
    return BlocConsumer<DeleteCommentBloc, DeleteCommentState>(
      listener: (BuildContext context, DeleteCommentState state) {
        if (state is DeleteCommentSuccessfulState) {
          _getPosts(context);
          _getComments(context);
        }
      },
      builder: (BuildContext context, DeleteCommentState state) {
        if (state is DeleteCommentProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return IconButton(
            icon: const Icon(Icons.delete, color: Colors.red, size: 25),
            onPressed: () => _deleteComment(context, comment),
          );
        }
      },
    );
  }
}
