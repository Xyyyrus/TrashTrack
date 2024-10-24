import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/sources/announcement/get_announcements_source.dart';
import 'package:trashtrack_user/models/announcement/announcement.dart';

typedef SESLT = Stream<Either<String, List<Announcement>>>;

class AnnouncementRepository {
  GetAnnouncementsSource getAnnouncementsSource;

  AnnouncementRepository({
    required this.getAnnouncementsSource,
  });

  SESLT getAnnouncements() {
    return getAnnouncementsSource.getAnnouncements();
  }
}
