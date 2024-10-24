import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/sources/profile/get_profile_source.dart';
import 'package:trashtrack_user/data/sources/profile/update_profile_source.dart';
import 'package:trashtrack_user/models/profile/profile.dart';

typedef FESPT = Future<Either<String, Profile>>;
typedef FESST = Future<Either<String, String>>;

class ProfileRepository {
  GetProfileSource getProfileSource;
  UpdateProfileSource updateProfileSource;

  ProfileRepository({
    required this.getProfileSource,
    required this.updateProfileSource,
  });

  FESPT getProfile(String routeId) async {
    return await getProfileSource.getProfile(routeId);
  }

  FESST updateProfile(Profile profile) async {
    return await updateProfileSource.updateProfile(profile);
  }
}
