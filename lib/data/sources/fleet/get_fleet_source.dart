import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/repositories/fleet_repository.dart';
import 'package:trashtrack_user/models/fleet/fleet.dart';

class GetFleetSource {
  SESFT getFleet(String id) {
    final firebaseFire = FirebaseFirestore.instance;
    final fleetsCol = firebaseFire.collection('fleets');

    final fleetRef = fleetsCol.doc(id);

    return fleetRef.snapshots().map((fleetSnapshot) {
      try {
        final fleetMap = fleetSnapshot.data() as Map<String, dynamic>;
        final fleetObj = Fleet.fromJson({
          ...fleetMap,
          'id': fleetSnapshot.id,
        });

        return Right(fleetObj);
      } catch (e) {
        return Left('Error parsing fleet data: $e');
      }
    });
  }
}
