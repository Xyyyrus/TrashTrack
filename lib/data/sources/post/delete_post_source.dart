import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';
import 'package:trashtrack_user/models/post/post.dart';

class DeletePostSource {
  FESST deletePost(Post post) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;

      final commentsCol = firebaseFire.collection('comments');
      final commentsQuery = commentsCol.where('postId', isEqualTo: post.id);

      final commentsSnapshot = await commentsQuery.get();
      final writeBatch = firebaseFire.batch();

      for (final commentDoc in commentsSnapshot.docs) {
        writeBatch.delete(commentDoc.reference);
      }

      await writeBatch.commit();

      final url = post.url;

      if (url != null && url.isNotEmpty) {
        final fireStorage = FirebaseStorage.instance;

        final urlRef = fireStorage.refFromURL(url);

        await urlRef.delete();
      }

      final postsCol = firebaseFire.collection('posts');

      final postDoc = postsCol.doc(post.id);

      await postDoc.delete();

      return const Right('Post successfully deleted');
    } catch (e) {
      String error = 'Error deleting post: $e';

      return Left(error);
    }
  }
}
