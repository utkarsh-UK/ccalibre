import 'package:ccalibre/data/models/application_model.dart';
import 'package:ccalibre/data/models/build_model.dart';

abstract class RemoteDatasource {
  Future<List<ApplicationModel>> getAllApplications(String token);

  Future<ApplicationModel> getApplication(String token, String applicationID);

  Future<void> createNewApplication(String token, String repositoryURL);

  Future<List<BuildModel>> getAllBuilds(
    String token, {
    String? applicationID,
    String? workflowID,
    String? branch,
  });

  Future<void> startNewBuild(
    String token, {
    required String applicationID,
    required String workflowID,
    String? branch,
  });

  Future<bool> cancelBuild(String token, {required String buildID});

  Future<BuildModel> getBuildStatus(
    String token, {
    required String buildID,
  });

  Future<void> addVariable(
    String token, {
    required String key,
    required String value,
    required String workflowID,
    required String applicationID,
    String? group,
  });

  Future<void> updateVariable(
    String token, {
    required String applicationID,
    required String variableID,
    required String value,
  });

  Future<bool> deleteVariable(
    String token, {
    required String applicationID,
    required String variableID,
  });
}
