import 'package:equatable/equatable.dart';

class Build extends Equatable {
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

  const Build({
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
  });

  @override
  List<Object?> get props => [id, applicationID, workflowID, branch];
}
