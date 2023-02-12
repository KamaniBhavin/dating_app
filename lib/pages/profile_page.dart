import 'package:dating_app/blocs/profiles_bloc/profiles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/profiles_bloc/profiles_state.dart';
import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesBloc, ProfilesState>(
      builder: (context, state) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;

        Profile profile = state.profiles.last;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                expandedHeight: (height * 0.4),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  title: Text(
                    '${profile.firstName}, ${profile.age}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                    ),
                  ),
                  background: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Image.network(
                      profile.profileImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'About',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              profile.bio,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Interests',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            subtitle: Row(
                              children: profile.interests
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      child: Chip(
                                        label: Text(e),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          ListTile(
                            title: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Pictures',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            subtitle: SizedBox(
                              height: height * 0.2,
                              child: ListView.builder(
                                itemCount: profile.pictures.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Image.network(
                                        profile.pictures[index],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
