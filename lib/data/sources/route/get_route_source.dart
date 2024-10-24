import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/repositories/route_repository.dart';
import 'package:trashtrack_user/models/route/route.dart' as rm;

class GetRouteSource {
  FESRT getRoute(String id) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final routesCol = firebaseFire.collection('routes');

      final routeRef = routesCol.doc(id);
      final routeSnapshot = await routeRef.get();

      final routeMap = routeSnapshot.data() as Map<String, dynamic>;

      final routeObj = rm.Route.fromJson({
        ...routeMap,
        'id': routeSnapshot.id,
      });

      return Right(routeObj);
    } catch (e) {
      String error = 'Error getting route: $e';

      return Left(error);
    }
  }
}
