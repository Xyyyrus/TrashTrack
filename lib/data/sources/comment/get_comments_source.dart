import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/converters/timestamp_converter.dart';
import 'package:trashtrack_user/data/repositories/comment_repository.dart';
import 'package:trashtrack_user/models/comment/comment.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/models/profile/profile.dart';

class GetCommentsSource {
  FESLT getComments(Post post) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final commentsCol = firebaseFire.collection('comments');
      final usersCol = firebaseFire.collection('users');

      final whereCond = commentsCol.where('postId', isEqualTo: post.id);
      final orderBy = whereCond.orderBy('createdAt', descending: true);
      final commentsSnapshot = await orderBy.get();

      final List<Comment> commentsObjects = [];

      for (var commentDoc in commentsSnapshot.docs) {
        final commentMap = commentDoc.data();
        var commentObject = Comment.fromJson({
          ...commentMap,
          'id': commentDoc.id,
          'createdAt': const TimestampConverter().toJson(
            commentMap['createdAt'],
          ),
        });

        final userRef = usersCol.doc(commentObject.uid);
        final userSnapshot = await userRef.get();
        final userMap = userSnapshot.data() as Map<String, dynamic>;
        final userObj = Profile.fromJson({
          ...userMap,
          'id': userSnapshot.id,
        });

        commentObject = commentObject.copyWith(
          author: '${userObj.firstname} ${userObj.lastname}',
        );

        commentsObjects.add(commentObject);
      }

      return Right(commentsObjects);
    } catch (e) {
      String error = 'Error getting comments: $e';

      return Left(error);
    }
  }
}
