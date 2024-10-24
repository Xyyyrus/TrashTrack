import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/repositories/profile_repository.dart';
import 'package:trashtrack_user/models/profile/profile.dart';

class UpdateProfileSource {
  FESST updateProfile(Profile profile) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final usersCol = firebaseFire.collection('users');

      final userRef = usersCol.doc(profile.id);
      await userRef.update({
        'firstname': profile.firstname,
        'lastname': profile.lastname,
        'barangay': profile.barangay,
      });

      return const Right('Profile updated successfully');
    } catch (e) {
      String error = 'Error updating profile: $e';

      return Left(error);
    }
  }
}
