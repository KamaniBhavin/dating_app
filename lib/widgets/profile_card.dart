import 'package:flutter/material.dart';

import '../models/profile.dart';

class ProfileCard extends StatefulWidget {
  final Profile profile;

  const ProfileCard({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.6;
    double width = MediaQuery.of(context).size.width * 0.8;

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.profile.profileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.05,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.profile.firstName}, ${widget.profile.age}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.profile.location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
