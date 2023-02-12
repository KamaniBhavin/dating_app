import 'package:equatable/equatable.dart';

import '../../models/profile.dart';

class ProfilesState extends Equatable {
  final List<Profile> profiles;

  const ProfilesState({required this.profiles});

  factory ProfilesState.initialState() => ProfilesState(
        profiles: List.generate(
          5,
          (index) => Profile.random(),
        ),
      );

  @override
  List<Object> get props => [profiles];

  ProfilesState copyWith({required List<Profile> profiles}) {
    return ProfilesState(profiles: profiles);
  }

  ProfilesState removeLast() {
    return copyWith(profiles: profiles.sublist(0, profiles.length - 1));
  }
}
