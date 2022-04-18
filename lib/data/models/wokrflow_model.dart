// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ccalibre/domain/entities/workflow.dart';

class WorkflowModel extends Workflow {
  final String id;
  final String name;
  final int successfulBuildCount;

  const WorkflowModel({
    required this.id,
    required this.name,
    required this.successfulBuildCount,
  }) : super(
          id: id,
          name: name,
          successfulBuildCount: successfulBuildCount,
        );

  @override
  List<Object?> get props => [id, name];

  factory WorkflowModel.fromJSON(Map<String, dynamic> json) => WorkflowModel(
        id: '${json['_id']}',
        name: '${json['name']}',
        successfulBuildCount: 3,
      );
}
