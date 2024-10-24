import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';
import 'package:trashtrack_user/models/comment/comment.dart';

class DeleteCommentSource {
  FESST deleteComment(Comment comment) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final commentsCol = firebaseFire.collection('comments');

      final commentRef = commentsCol.doc(comment.id);

      await commentRef.delete();

      return const Right('Comment successfully deleted');
    } catch (e) {
      String error = 'Error deleting comment: $e';

      return Left(error);
    }
  }
}
