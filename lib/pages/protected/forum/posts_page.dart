import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/post/delete_post/delete_post_bloc.dart';
import 'package:trashtrack_user/blocs/post/get_posts/get_posts_bloc.dart';
import 'package:trashtrack_user/extensions/timestamp_formatter.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/pages/protected/forum/add_post_page.dart';
import 'package:trashtrack_user/pages/protected/forum/edit_post_page.dart';
import 'package:trashtrack_user/pages/protected/forum/post_information_page.dart';
import 'package:trashtrack_user/pages/protected/forum/report_post_page.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_cached_image.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    _getPosts(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Forum'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: buildGetPostsBB(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const AddPostPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  BlocBuilder<GetPostsBloc, GetPostsState> buildGetPostsBB() {
    return BlocBuilder<GetPostsBloc, GetPostsState>(
      builder: (BuildContext context, GetPostsState state) {
        if (state is GetPostsSuccessfulState) {
          final allPosts = state.posts;

          if (allPosts.isNotEmpty) {
            return buildAllPostsLB(allPosts);
          } else {
            return const Center(
              child: Text(
                'No post yet',
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

  ListView buildAllPostsLB(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        Post post = posts[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => PostInformationPage(
                  post: post,
                ),
              ),
            ),
            child: buildActualPostCard(context, post),
          ),
        );
      },
    );
  }

  Card buildActualPostCard(BuildContext context, Post post) {
    String? url = post.url;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildCardHeaderRow(context, post),
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              post.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            buildImageCacheNI(url),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Icon(Icons.comment, size: 15),
                const SizedBox(width: 5),
                Text(
                  post.commentsCount.toString(),
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildCardHeaderRow(BuildContext context, Post post) {
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
        buildEditPostIB(context, post),
        buildDeletePostBC(post),
      ],
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

  Widget buildImageCacheNI(String? url) {
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
}
