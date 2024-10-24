import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';
import 'package:trashtrack_user/models/post/post.dart';

class AddPostSource {
  FESST addPost(Post post) async {
    try {
      final image = post.image;
      var url = '';

      if (image != null) {
        final firebaseStor = FirebaseStorage.instance;

        final rootRef = firebaseStor.ref();
        final postsRef = rootRef.child('posts_images');
        final imageRef = postsRef.child('${DateTime.now()}.jpg');

        await imageRef.putFile(image);

        url = await imageRef.getDownloadURL();
      }

      final firebaseFire = FirebaseFirestore.instance;
      final postsCol = firebaseFire.collection('posts');

      User? user = FirebaseAuth.instance.currentUser;
      String uid = user?.uid ?? '';

      await postsCol.add({
        'title': post.title,
        'body': post.body,
        'url': url,
        'createdAt': Timestamp.now(),
        'uid': uid,
      });

      return const Right('Post successfully added');
    } catch (e) {
      String error = 'Error adding post: $e';

      return Left(error);
    }
  }
}
