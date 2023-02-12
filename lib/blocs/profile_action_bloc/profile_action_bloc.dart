import 'dart:ui';

import 'package:dating_app/blocs/profile_action_bloc/profile_action_event.dart';
import 'package:dating_app/blocs/profile_action_bloc/profile_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ProfileStatus {
  LIKE,
  DISLIKE,
  SUPERLIKE,
}

class ProfileActionBloc extends Bloc<ProfileActionEvent, ProfileActionState> {
  ProfileActionBloc() : super(ProfileActionState.initialState()) {
    on<ProfileActionOnPanStartEvent>(
        (event, emit) => emit(state.copyWith(isSwiping: true)));

    on<ProfileActionOnPanUpdateEvent>((event, emit) =>
        emit(state.copyWith(offset: event.details.delta, isSwiping: true)));

    on<ProfileActionOnPanEndEvent>(profileActionOnPanEndEventHandler);
  }

  void profileActionOnPanEndEventHandler(
    ProfileActionEvent event,
    Emitter<ProfileActionState> emit,
  ) {
    switch (getProfileStatus()) {
      case ProfileStatus.LIKE:
        emit(state.copyWith(
          profile: event.profile,
          isSwiping: false,
          offset: const Offset(1500, 0),
          profileStatus: ProfileStatus.LIKE,
        ));
        break;
      case ProfileStatus.DISLIKE:
        emit(state.copyWith(
          profile: event.profile,
          isSwiping: false,
          offset: const Offset(-1500, 0),
          profileStatus: ProfileStatus.DISLIKE,
        ));
        break;
      case ProfileStatus.SUPERLIKE:
        emit(state.copyWith(
          profile: event.profile,
          isSwiping: false,
          offset: const Offset(0, -1500),
          profileStatus: ProfileStatus.SUPERLIKE,
        ));
        break;
      default:
        emit(state.copyWith(
          profile: event.profile,
          isSwiping: false,
          offset: Offset.zero,
          profileStatus: null,
        ));
    }
    emit(state.reset());
  }

  ProfileStatus? getProfileStatus() {
    if (state.offset.dx > 200) {
      return ProfileStatus.LIKE;
    } else if (state.offset.dx < -200) {
      return ProfileStatus.DISLIKE;
    } else if (state.offset.dy < -200) {
      return ProfileStatus.SUPERLIKE;
    } else {
      return null;
    }
  }
}
