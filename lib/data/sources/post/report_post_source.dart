import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';
import 'package:trashtrack_user/models/report/report.dart';

class ReportPostSource {
  FESST reportPost(Report report) async {
    try {
      final firebaseFire = FirebaseFirestore.instance;
      final reportsCol = firebaseFire.collection('reports');

      await reportsCol.add({
        'reason': report.reason,
        'postId': report.postId,
        'createdAt': Timestamp.now(),
      });

      return const Right('Post successfully reported');
    } catch (e) {
      String error = 'Error reporting post: $e';

      return Left(error);
    }
  }
}
