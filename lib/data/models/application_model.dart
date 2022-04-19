// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ccalibre/data/models/build_model.dart';
import 'package:ccalibre/data/models/variable_model.dart';
import 'package:ccalibre/data/models/wokrflow_model.dart';
import 'package:ccalibre/domain/entities/application.dart';

class ApplicationModel extends Application {
  final String id;
  final String name;
  final String projectType;
  final List<String> branches;
  final List<VariableModel> variables;
  final DateTime createdAt;
  final String lastBuildID;
  final String repositoryURL;
  final List<WorkflowModel> workflows;
  final List<BuildModel> builds;

  const ApplicationModel({
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
  }) : super(
          id: id,
          name: name,
          repositoryURL: repositoryURL,
          branches: branches,
          builds: builds,
          createdAt: createdAt,
          lastBuildID: lastBuildID,
          projectType: projectType,
          variables: variables,
          workflows: workflows,
        );

  @override
  List<Object?> get props => [id, name, branches];

  factory ApplicationModel.fromJSON(Map<String, dynamic> json) =>
      ApplicationModel(
        id: '${json['_id']}',
        name: '${json['appName']}',
        createdAt: DateTime.now(),
        repositoryURL: '${json['repository']['htmlUrl']}',
        lastBuildID: '${json['lastBuildId'] ?? ''}',
        projectType: '${json['projectType']}',
        branches: (json['branches'] as List<dynamic>)
            .map<String>((br) => '$br')
            .toList(),
        // builds: (json['builds'] as List<dynamic>)
        //     .map<BuildModel>((build) => BuildModel.fromJSON(build))
        //     .toList(),
        
        variables: (json['appEnvironmentVariables']['variables']
                as List<dynamic>)
            .map<VariableModel>((variable) => VariableModel.fromJSON(variable))
            .toList(),
        workflows: (json['workflows'] as Map<String, dynamic>)
            .keys
            .toList()
            .map<WorkflowModel>(
                (workID) => WorkflowModel.fromJSON(json['workflows'][workID]))
            .toList(),
      );
}
