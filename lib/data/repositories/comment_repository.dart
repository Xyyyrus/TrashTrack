import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/sources/comment/add_comment_source.dart';
import 'package:trashtrack_user/data/sources/comment/delete_comment_source.dart';
import 'package:trashtrack_user/data/sources/comment/edit_comment_source.dart';
import 'package:trashtrack_user/data/sources/comment/get_comments_source.dart';
import 'package:trashtrack_user/models/comment/comment.dart';
import 'package:trashtrack_user/models/post/post.dart';

typedef FESST = Future<Either<String, String>>;
typedef FESLT = Future<Either<String, List<Comment>>>;

class CommentRepository {
  AddCommentSource addCommentSource;
  GetCommentsSource getCommentsSource;
  DeleteCommentSource deleteCommentSource;
  EditCommentSource editCommentSource;

  CommentRepository({
    required this.addCommentSource,
    required this.getCommentsSource,
    required this.deleteCommentSource,
    required this.editCommentSource,
  });

  FESST addComment(Comment comment) async {
    return await addCommentSource.addComment(comment);
  }

  FESLT getComments(Post post) async {
    return await getCommentsSource.getComments(post);
  }

  FESST deleteComment(Comment comment) async {
    return await deleteCommentSource.deleteComment(comment);
  }

  FESST editComment(Comment comment) async {
    return await editCommentSource.editComment(comment);
  }
}
