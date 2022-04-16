import 'package:ccalibre/domain/entities/build.dart';
import 'package:ccalibre/domain/entities/variable.dart';
import 'package:ccalibre/domain/entities/workflow.dart';
import 'package:equatable/equatable.dart';

class Application extends Equatable {
  final String id;
  final String name;
  final String projectType;
  final List<String> branches;
  final List<Variable> variables;
  final DateTime createdAt;
  final String lastBuildID;
  final String repositoryURL;
  final List<Workflow> workflows;
  final List<Build> builds;

  const Application({
    required this.id,
    required this.name,
    this.projectType = 'flutter-app',
    this.branches = const [],
    this.variables = const [],
    required this.createdAt,
    this.lastBuildID = "",
    required this.repositoryURL,
    this.workflows = const [],
    this.builds = const [],
  });

  @override
  List<Object?> get props => [id, name, branches];
}
