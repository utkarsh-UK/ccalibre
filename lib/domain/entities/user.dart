import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;
  final String githubUsername;

  const User({required this.token, required this.githubUsername});

  @override
  List<Object?> get props => [token, githubUsername];
}
