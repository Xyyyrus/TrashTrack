part of 'get_announcements_bloc.dart';

@immutable
sealed class GetAnnouncementsState {}

class GetAnnouncementsInitialState extends GetAnnouncementsState {}

class GetAnnouncementsProcessingState extends GetAnnouncementsState {}

class GetAnnouncementsSuccessfulState extends GetAnnouncementsState {
  final List<Announcement> announcements;

  GetAnnouncementsSuccessfulState(this.announcements);
}

class GetAnnouncementsErrorState extends GetAnnouncementsState {
  final String message;

  GetAnnouncementsErrorState(this.message);
}
