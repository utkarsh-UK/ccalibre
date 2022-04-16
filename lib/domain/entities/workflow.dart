import 'package:equatable/equatable.dart';

class Workflow extends Equatable {
  final String id;
  final String name;
  final int successfulBuildCount;

  const Workflow({
    required this.id,
    required this.name,
    required this.successfulBuildCount,
  });

  @override
  List<Object?> get props => [id, name];
}
