import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/converters/timestamp_converter.dart';
import 'package:trashtrack_user/data/repositories/post_repository.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/models/profile/profile.dart';

class GetPostsSource {
  FESLT getPosts() async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final postsCol = firebaseFire.collection('posts');
      final usersCol = firebaseFire.collection('users');
      final commentsCol = firebaseFire.collection('comments');

      final orderBy = postsCol.orderBy('createdAt', descending: true);
      final postsSnapshot = await orderBy.get();

      final List<Post> postsObjects = [];

      for (var postDoc in postsSnapshot.docs) {
        final postMap = postDoc.data();
        var postObject = Post.fromJson({
          ...postMap,
          'id': postDoc.id,
          'createdAt': const TimestampConverter().toJson(postMap['createdAt']),
        });

        final userRef = usersCol.doc(postObject.uid);
        final userSnapshot = await userRef.get();
        final userMap = userSnapshot.data() as Map<String, dynamic>;
        final userObj = Profile.fromJson({
          ...userMap,
          'id': userSnapshot.id,
        });

        final commentsCond = commentsCol.where(
          'postId',
          isEqualTo: postObject.id,
        );
        final commentsSnapshot = await commentsCond.get();
        final commentsCount = commentsSnapshot.size;

        postObject = postObject.copyWith(
          author: '${userObj.firstname} ${userObj.lastname}',
          commentsCount: commentsCount,
        );

        postsObjects.add(postObject);
      }

      return Right(postsObjects);
    } catch (e) {
      String error = 'Error getting posts: $e';

      return Left(error);
    }
  }
}
