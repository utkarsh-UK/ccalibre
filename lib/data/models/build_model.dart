// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ccalibre/domain/entities/build.dart';

class BuildModel extends Build {
  final String id;
  final String applicationID;
  final String workflowID;
  final String branch;
  final String instanceType;
  final String version;
  final String status;
  final int artefactsCount;
  final DateTime startedAt;
  final DateTime finishedAt;

  const BuildModel({
    required this.id,
    required this.applicationID,
    required this.workflowID,
    required this.branch,
    this.instanceType = 'mac_mini',
    required this.version,
    required this.status,
    required this.artefactsCount,
    required this.startedAt,
    required this.finishedAt,
  }) : super(
          applicationID: applicationID,
          workflowID: workflowID,
          branch: branch,
          id: id,
          version: version,
          instanceType: instanceType,
          status: status,
          artefactsCount: artefactsCount,
          startedAt: startedAt,
          finishedAt: finishedAt,
        );

  @override
  List<Object?> get props => [id, applicationID, branch];

  factory BuildModel.fromJSON(Map<String, dynamic> json) => BuildModel(
        id: '${json['_id']}',
        applicationID: '${json['appId']}',
        workflowID: '${json['workflowId']}',
        branch: '${json['branch']}',
        version: '${json['version']}',
        status: '${json['status']}',
        artefactsCount: (json['artefacts'] as List<dynamic>).length,
        startedAt:
            DateTime.parse('${json['startedAt']}'.split('.').first + '+0000'),
        finishedAt:
            DateTime.parse('${json['finishedAt']}'.split('.').first + '+0000'),
        instanceType: '${json['instanceType'] ?? 'mac_mini'}',
      );
}
