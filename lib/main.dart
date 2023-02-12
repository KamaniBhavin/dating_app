import 'package:dating_app/pages/home_page.dart';
import 'package:dating_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'blocs/profile_action_bloc/profile_action_bloc.dart';
import 'blocs/profiles_bloc/profiles_bloc.dart';

final GoRouter _goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'profile/:id',
          builder: (context, state) {
            return const ProfilePage();
          },
        ),
      ],
    ),
  ],
);

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ProfileActionBloc>(
            create: (context) => ProfileActionBloc(),
          ),
          BlocProvider<ProfilesBloc>(
            create: (context) => ProfilesBloc(
                profileActionBloc: context.read<ProfileActionBloc>()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: _goRouter,
          title: 'Dating App',
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
