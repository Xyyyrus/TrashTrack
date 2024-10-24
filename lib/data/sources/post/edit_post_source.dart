import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';
import 'package:trashtrack_user/models/post/post.dart';

class EditPostSource {
  FESST editPost(Post post) async {
    try {
      final image = post.image;
      var url = post.url;

      if (image != null) {
        final fireStorage = FirebaseStorage.instance;

        if (url != null && url.isNotEmpty) {
          final urlRef = fireStorage.refFromURL(url);
          await urlRef.delete();
        }

        final rootRef = fireStorage.ref();
        final postsRef = rootRef.child('posts_images');
        final imageRef = postsRef.child('${DateTime.now()}.jpg');

        await imageRef.putFile(image);

        url = await imageRef.getDownloadURL();
      }

      final firebaseFire = FirebaseFirestore.instance;
      final postsCol = firebaseFire.collection('posts');

      final postRef = postsCol.doc(post.id);

      await postRef.update({
        'title': post.title,
        'body': post.body,
        'url': url,
      });

      return const Right('Post successfully updated');
    } catch (e) {
      String error = 'Error updating post: $e';

      return Left(error);
    }
  }
}
