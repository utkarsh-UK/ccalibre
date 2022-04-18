// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ccalibre/domain/entities/user.dart';

class UserModel extends User {
  final String token;
  final String githubUsername;

  const UserModel({required this.token, required this.githubUsername})
      : super(
          githubUsername: githubUsername,
          token: token,
        );

  @override
  List<Object?> get props => [token, githubUsername];

}
