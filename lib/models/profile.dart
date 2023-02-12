import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

class Profile extends Equatable {
  final String uuid;
  final String firstName;
  final String lastName;
  final int age;
  final String bio;
  final String profileImage;
  final String location;
  final List<String> pictures;
  final List<String> interests;

  const Profile({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.bio,
    required this.profileImage,
    required this.location,
    required this.pictures,
    required this.interests,
  });

  factory Profile.random() {
    return Profile(
      uuid: const Uuid().v4(),
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      age: faker.randomGenerator.integer(30),
      bio: faker.lorem.sentences(3).join(' '), // 3 sentences
      location: faker.address.city(),
      pictures: List.generate(3, (index) => faker.image.image()),
      interests: List.generate(
        faker.randomGenerator.integer(5),
        (index) => faker.randomGenerator.element(['dogs', 'cats', 'birds']),
      ),
      profileImage: faker.image.image(
        keywords: ['dating', 'girls'],
        random: true,
      ),
    );
  }

  @override
  List<Object?> get props => [
        uuid,
        firstName,
        lastName,
        age,
        bio,
        profileImage,
        location,
        pictures,
        interests,
      ];

  @override
  String toString() {
    return 'Profile { uuid: $uuid, firstName: $firstName, lastName: $lastName, age: $age, bio: $bio, profileImage: $profileImage, location: $location, pictures: $pictures, interests: $interests }';
  }
}
