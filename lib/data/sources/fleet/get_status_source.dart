import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/repositories/fleet_repository.dart';
import 'package:trashtrack_user/models/fleet/fleet.dart';

class GetStatusSource {
  FESFT getStatus(String id) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final fleetsCol = firebaseFire.collection('fleets');

      final fleetRef = fleetsCol.doc(id);
      final fleetSnapshot = await fleetRef.get();

      final fleetMap = fleetSnapshot.data() as Map<String, dynamic>;

      final fleetObj = Fleet.fromJson({
        ...fleetMap,
        'id': fleetSnapshot.id,
      });

      return Right(fleetObj);
    } catch (e) {
      String error = 'Error getting fleet: $e';

      return Left(error);
    }
  }
}
