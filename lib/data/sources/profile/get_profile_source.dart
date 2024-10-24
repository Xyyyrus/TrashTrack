import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trashtrack_user/data/repositories/profile_repository.dart';
import 'package:trashtrack_user/models/profile/profile.dart';

class GetProfileSource {
  FESPT getProfile(String routeId) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final usersCol = firebaseFire.collection('users');

      User? user = FirebaseAuth.instance.currentUser;
      String uid = user?.uid ?? '';

      final userRef = usersCol.doc(uid);
      var userSnapshot = await userRef.get();

      if (userSnapshot.exists) {
        final userMap = userSnapshot.data() as Map<String, dynamic>;

        final userObj = Profile.fromJson({
          ...userMap,
          'id': userSnapshot.id,
        });

        return Right(userObj);
      } else {
        final userData = {
          'firstname': 'Firstname',
          'lastname': 'Lastname',
          'barangay': routeId,
          'email': user?.email,
          'role': 'User',
        };

        await userRef.set(userData);

        userSnapshot = await userRef.get();

        final userMap = userSnapshot.data() as Map<String, dynamic>;

        final userObj = Profile.fromJson({
          ...userMap,
          'id': userSnapshot.id,
        });

        return Right(userObj);
      }
    } catch (e) {
      String error = 'Error getting profile: $e';

      return Left(error);
    }
  }
}
