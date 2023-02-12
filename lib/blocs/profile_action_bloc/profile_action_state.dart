import 'dart:ui';

import 'package:dating_app/blocs/profile_action_bloc/profile_action_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/profile.dart';

class ProfileActionState extends Equatable {
  final Offset offset;
  final bool isSwiping;
  final Profile? profile;
  final ProfileStatus? profileStatus;

  const ProfileActionState(
      {required this.offset,
      this.isSwiping = false,
      this.profile,
      this.profileStatus});

  factory ProfileActionState.initialState() =>
      const ProfileActionState(offset: Offset.zero);

  @override
  List<Object?> get props => [offset, isSwiping, profile, profileStatus];

  @override
  String toString() {
    return 'ProfileActionState{offset: $offset, isSwiping: $isSwiping, profile: $profile, profileStatus: $profileStatus}';
  }

  ProfileActionState copyWith({
    Profile? profile,
    Offset? offset,
    bool? isSwiping,
    ProfileStatus? profileStatus,
  }) {
    return ProfileActionState(
      offset: this.offset + (offset ?? Offset.zero),
      isSwiping: isSwiping ?? this.isSwiping,
      profile: profile,
      profileStatus: profileStatus,
    );
  }

  ProfileActionState reset() {
    return const ProfileActionState(offset: Offset.zero, isSwiping: false);
  }
}
