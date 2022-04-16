import 'package:equatable/equatable.dart';

class Variable extends Equatable {
  final String id;
  final String variableKey;
  final bool isSecure;
  final String group;
  final String workflowID;
  final String workflowName;

  const Variable({
    required this.id,
    required this.variableKey,
    this.isSecure = true,
    this.group = '',
    this.workflowID = '',
    this.workflowName = '',
  });

  @override
  List<Object?> get props => [id, variableKey];
}
