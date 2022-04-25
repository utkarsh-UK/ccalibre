import 'package:equatable/equatable.dart';

/// Class for holding user related params
class UserParams extends Equatable {
  final String type;
  final String sort;
  final String direction;
  final int perPage;
  final int page;

  const UserParams({
    this.type = 'all',
    this.sort = 'created',
    this.direction = 'desc',
    this.perPage = 30,
    this.page = 1,
  });

  @override
  List<Object?> get props => [type, sort];
}
