import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/converters/timestamp_converter.dart';
import 'package:trashtrack_user/data/repositories/analysis_repository.dart';
import 'package:trashtrack_user/models/analysis/analysis.dart';

class GetAnalysisSource {
  FESLT getAnalysis() async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final analysisCol = firebaseFire.collection('analysis');

      final orderBy = analysisCol.orderBy('date');
      final analysisSnapshot = await orderBy.get();

      final List<Analysis> analysisObjects = [];

      for (var analysisDoc in analysisSnapshot.docs) {
        final analysisMap = analysisDoc.data();
        var analysisObject = Analysis.fromJson({
          ...analysisMap,
          'id': analysisDoc.id,
          'date': const TimestampConverter().toJson(
            analysisMap['date'],
          ),
        });

        analysisObjects.add(analysisObject);
      }

      return Right(analysisObjects);
    } catch (e) {
      String error = 'Error getting analysis: $e';

      return Left(error);
    }
  }
}
