import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/converters/timestamp_converter.dart';
import 'package:trashtrack_user/data/repositories/announcement_repository.dart';
import 'package:trashtrack_user/models/announcement/announcement.dart';

class GetAnnouncementsSource {
  SESLT getAnnouncements() {
    final firebaseFire = FirebaseFirestore.instance;
    final announcesCol = firebaseFire.collection('announcements');

    final orderBy = announcesCol.orderBy('createdAt', descending: true);

    return orderBy.snapshots().map(
      (announceSnapshots) {
        try {
          final announceObjects = announceSnapshots.docs.map((
            announceSnapshot,
          ) {
            final announceMap = announceSnapshot.data();
            final announceObject = Announcement.fromJson({
              ...announceMap,
              'id': announceSnapshot.id,
              'createdAt': const TimestampConverter().toJson(
                announceMap['createdAt'],
              ),
            });

            return announceObject;
          }).toList();

          return Right(announceObjects);
        } catch (e) {
          String error = 'Error getting announcements: $e';

          return Left(error);
        }
      },
    );
  }
}
