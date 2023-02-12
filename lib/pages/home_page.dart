import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/profiles_bloc/profiles_bloc.dart';
import '../blocs/profiles_bloc/profiles_state.dart';
import '../models/profile.dart';
import '../widgets/interactive_profile_card.dart';
import '../widgets/profile_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 64.0,
              ),
              BlocBuilder(
                bloc: context.read<ProfilesBloc>(),
                builder: (BuildContext context, ProfilesState state) {
                  return ProfilesStack(profiles: state.profiles);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilesStack extends StatefulWidget {
  final List<Profile> profiles;

  const ProfilesStack({
    Key? key,
    required this.profiles,
  }) : super(key: key);

  @override
  State<ProfilesStack> createState() => _ProfilesStackState();
}

class _ProfilesStackState extends State<ProfilesStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: widget.profiles
          .map((profile) => profile == widget.profiles.last
              ? InteractiveProfileCard(profile: profile)
              : ProfileCard(profile: profile))
          .toList(),
    );
  }
}
