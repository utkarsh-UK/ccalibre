// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ccalibre/domain/entities/variable.dart';

class VariableModel extends Variable {
  final String id;
  final String variableKey;
  final bool isSecure;
  final String group;
  final String workflowID;
  final String workflowName;

  const VariableModel({
    required this.id,
    required this.variableKey,
    this.isSecure = true,
    this.group = '',
    this.workflowID = '',
    this.workflowName = '',
  }) : super(
          id: id,
          variableKey: variableKey,
          group: group,
          isSecure: isSecure,
          workflowID: workflowID,
          workflowName: workflowName,
        );

  @override
  List<Object?> get props => [id, variableKey];

  factory VariableModel.fromJSON(Map<String, dynamic> json) => VariableModel(
        id: '${json['id']}',
        variableKey: '${json['key']}',
        group: '${json['group'] ?? ''}',
        isSecure: json['secure'] ?? true,
        workflowID: '${json['workflowId']}',
        workflowName: '${json['workflowName']}',
      );
}
