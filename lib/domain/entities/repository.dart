import 'package:equatable/equatable.dart';

class Repository extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final String description;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Repository({
    required this.id,
    required this.name,
    required this.fullName,
    this.description = '',
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, fullName, url];
}
