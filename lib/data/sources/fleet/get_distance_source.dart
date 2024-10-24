import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trashtrack_user/data/repositories/fleet_repository.dart';
import 'package:http/http.dart' as http;

class GetDistanceSource {
  FESIT getDistance(LatLng userLoc, LatLng driverLoc) async {
    try {
      final origLat = userLoc.latitude;
      final origLng = userLoc.longitude;
      final destLat = driverLoc.latitude;
      final destLng = driverLoc.longitude;

      const path = 'https://maps.googleapis.com/maps/api/distancematrix/json';
      final origins = '?origins=$origLat,$origLng';
      final destinations = '&destinations=$destLat,$destLng';
      const key = '&key=AIzaSyC7Ssud77ds2HFTI5a9fJfAcfEUAL52r90';
      final url = '$path$origins$destinations$key';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        int distance = data['rows'][0]['elements'][0]['distance']['value'];

        return Right(distance);
      } else {
        return const Left('Failed to load distance');
      }
    } catch (e) {
      String error = 'Error getting distance: $e';

      return Left(error);
    }
  }
}
