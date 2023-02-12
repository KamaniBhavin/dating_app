import 'package:dating_app/models/profile.dart';
import 'package:equatable/equatable.dart';

import '../profile_action_bloc/profile_action_bloc.dart';

class ProfilesEvent extends Equatable {
  const ProfilesEvent();

  @override
  List<Object> get props => [];
}

class FetchProfilesEvent extends ProfilesEvent {
  const FetchProfilesEvent();
}

class UpdateCurrentProfileStatusEvent extends ProfilesEvent {
  final Profile profile;
  final ProfileStatus profileStatus;

  const UpdateCurrentProfileStatusEvent(
      {required this.profile, required this.profileStatus});
}
