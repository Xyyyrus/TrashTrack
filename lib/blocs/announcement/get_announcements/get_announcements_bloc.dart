import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/data/repositories/announcement_repository.dart';
import 'package:trashtrack_user/models/announcement/announcement.dart';

part 'get_announcements_event.dart';
part 'get_announcements_state.dart';

typedef GABT = Bloc<GetAnnouncementsEvent, GetAnnouncementsState>;

class GetAnnouncementsBloc extends GABT {
  final AnnouncementRepository repository;

  GetAnnouncementsBloc(
    this.repository,
  ) : super(GetAnnouncementsInitialState()) {
    on<GetAnnouncementsEvent>((event, emit) async {
      emit(GetAnnouncementsProcessingState());

      await for (final result in repository.getAnnouncements()) {
        result.fold(
          (String l) => emit(GetAnnouncementsErrorState(l)),
          (List<Announcement> r) => emit(GetAnnouncementsSuccessfulState(r)),
        );
      }
    });
  }
}
