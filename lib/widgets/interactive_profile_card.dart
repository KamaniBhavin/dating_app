import 'package:dating_app/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/profile_action_bloc/profile_action_bloc.dart';
import '../blocs/profile_action_bloc/profile_action_event.dart';
import '../blocs/profile_action_bloc/profile_action_state.dart';
import '../models/profile.dart';

class InteractiveProfileCard extends StatefulWidget {
  final Profile profile;

  const InteractiveProfileCard({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  State<InteractiveProfileCard> createState() => _InteractiveProfileCardState();
}

class _InteractiveProfileCardState extends State<InteractiveProfileCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: context.read<ProfileActionBloc>(),
        builder: (BuildContext context, ProfileActionState state) {
          double width = MediaQuery.of(context).size.width;
          return AnimatedContainer(
            duration: Duration(
              milliseconds: state.isSwiping ? 300 : 0,
            ),
            transform: Matrix4.translationValues(
              state.offset.dx,
              state.offset.dy,
              0,
            )..rotateZ(state.offset.dx / width * 0.7),
            child: GestureDetector(
              onPanStart: (details) {
                context.read<ProfileActionBloc>().add(
                      ProfileActionOnPanStartEvent(
                        widget.profile,
                        details: details,
                      ),
                    );
              },
              onPanUpdate: (details) {
                context.read<ProfileActionBloc>().add(
                      ProfileActionOnPanUpdateEvent(
                        widget.profile,
                        details: details,
                      ),
                    );
              },
              onPanEnd: (details) {
                context.read<ProfileActionBloc>().add(
                      ProfileActionOnPanEndEvent(
                        widget.profile,
                        details: details,
                      ),
                    );
              },
              onTap: () => {
                context.go('/profile/${widget.profile.uuid}'),
              },
              child: ProfileCard(
                profile: widget.profile,
              ),
            ),
          );
        });
  }
}
