import 'dart:async';

import 'package:dating_app/blocs/profiles_bloc/profiles_event.dart';
import 'package:dating_app/blocs/profiles_bloc/profiles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/profile.dart';
import '../profile_action_bloc/profile_action_bloc.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  final ProfileActionBloc profileActionBloc;
  late final StreamSubscription profileActionBlocSubscription;

  ProfilesBloc({required this.profileActionBloc})
      : super(ProfilesState.initialState()) {
    profileActionBlocSubscription = profileActionBloc.stream.listen((event) {
      if (event.profileStatus != null) {
        add(
          UpdateCurrentProfileStatusEvent(
            profile: event.profile!,
            profileStatus: event.profileStatus!,
          ),
        );
      }

      if (state.profiles.length <= 3) {
        add(const FetchProfilesEvent());
      }
    });

    on<FetchProfilesEvent>(
      (event, emit) => {
        emit(
          state.copyWith(
            profiles: List.generate(10, (index) => Profile.random()),
          ),
        )
      },
    );

    on<UpdateCurrentProfileStatusEvent>(
      (event, emit) => emit(
        state.removeLast(),
      ),
    );
  }

  @override
  Future<void> close() {
    profileActionBlocSubscription.cancel();
    return super.close();
  }
}
