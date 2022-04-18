// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ccalibre/domain/entities/build.dart';

class BuildModel extends Build {
  final String id;
  final String applicationID;
  final String branch;
  final String instanceType;
  final String version;
  final String status;
  final DateTime startedAt;
  final DateTime finishedAt;

  const BuildModel({
    required this.id,
    required this.applicationID,
    required this.branch,
    this.instanceType = 'mac_mini',
    required this.version,
    required this.status,
    required this.startedAt,
    required this.finishedAt,
  }) : super(
          applicationID: applicationID,
          branch: branch,
          id: id,
          version: version,
          instanceType: instanceType,
          status: status,
          startedAt: startedAt,
          finishedAt: finishedAt,
        );

  @override
  List<Object?> get props => [id, applicationID, branch];

  factory BuildModel.fromJSON(Map<String, dynamic> json) => BuildModel(
        id: '${json['_id']}',
        applicationID: '${json['appId']}',
        branch: '${json['branch']}',
        version: '${json['version']}',
        status: '${json['status']}',
        startedAt: DateTime.parse('${json['started_at']}'),
        finishedAt: DateTime.parse('${json['finished_at']}'),
        instanceType: '${json['instanceType'] ?? 'mac_mini'}',
      );
}
