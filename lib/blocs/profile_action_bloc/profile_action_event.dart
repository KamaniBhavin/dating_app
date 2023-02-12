import 'package:dating_app/models/profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ProfileActionEvent extends Equatable {
  final Profile profile;

  const ProfileActionEvent({required this.profile});

  @override
  List<Object> get props => [profile];
}

class ProfileActionOnPanStartEvent extends ProfileActionEvent {
  final DragStartDetails details;

  const ProfileActionOnPanStartEvent(Profile profile, {required this.details})
      : super(profile: profile);
}

class ProfileActionOnPanUpdateEvent extends ProfileActionEvent {
  final DragUpdateDetails details;

  const ProfileActionOnPanUpdateEvent(Profile profile, {required this.details})
      : super(profile: profile);
}

class ProfileActionOnPanEndEvent extends ProfileActionEvent {
  final DragEndDetails details;

  const ProfileActionOnPanEndEvent(Profile profile, {required this.details})
      : super(profile: profile);
}
