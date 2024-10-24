import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';
import 'package:trashtrack_user/models/comment/comment.dart';

class AddCommentSource {
  FESST addComment(Comment comment) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final commentsCol = firebaseFire.collection('comments');

      final user = FirebaseAuth.instance.currentUser;
      final uid = user?.uid ?? '';

      await commentsCol.add({
        'postId': comment.postId,
        'uid': uid,
        'comment': comment.comment,
        'createdAt': Timestamp.now(),
      });

      return const Right('Comment successfully added');
    } catch (e) {
      String error = 'Error adding comment: $e';

      return Left(error);
    }
  }
}
