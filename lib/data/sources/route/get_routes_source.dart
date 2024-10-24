import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/models/route/route.dart';

import '../../repositories/route_repository.dart';

class GetRoutesSource {
  FESLT getRoutes() async {
    final firebaseFire = FirebaseFirestore.instance;
    final routesCol = firebaseFire.collection('routes');

    try {
      final orderBy = routesCol.orderBy('routeName');
      final routesSnapshot = await orderBy.get();

      final List<Route> routesObjects = [];

      for (var routeDoc in routesSnapshot.docs) {
        final routeMap = routeDoc.data();
        var routeObject = Route.fromJson({
          ...routeMap,
          'id': routeDoc.id,
        });

        routesObjects.add(routeObject);
      }

      return Right(routesObjects);
    } catch (e) {
      String error = 'Error getting routes: $e';

      return Left(error);
    }
  }
}
