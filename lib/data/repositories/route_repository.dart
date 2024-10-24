import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/sources/route/get_route_source.dart';
import 'package:trashtrack_user/data/sources/route/get_routes_source.dart';
import 'package:trashtrack_user/models/route/route.dart' as rm;

typedef FESRT = Future<Either<String, rm.Route>>;
typedef FESLT = Future<Either<String, List<rm.Route>>>;

class RouteRepository {
  GetRouteSource getRouteSource;
  GetRoutesSource getRoutesSource;

  RouteRepository({
    required this.getRouteSource,
    required this.getRoutesSource,
  });

  FESRT getRoute(String id) async {
    return await getRouteSource.getRoute(id);
  }

  FESLT getRoutes() async {
    return await getRoutesSource.getRoutes();
  }
}
