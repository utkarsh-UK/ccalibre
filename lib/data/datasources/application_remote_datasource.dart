import 'package:ccalibre/data/models/application_model.dart';
import 'package:ccalibre/data/models/build_model.dart';

abstract class ApplicationRemoteDatasource {
  /// Returns list of all applications added in Codemagic.
  Future<List<ApplicationModel>> getAllApplications(String token);

  /// Returns details for given [applicationID].
  Future<ApplicationModel> getApplication(String token, String applicationID);

  /// Adds new application to codemagic. [repositoryURL] must be a valid URL.
  Future<void> createNewApplication(String token, String repositoryURL);

  /// Fetches all builds for given [token].
  ///
  /// Filters builds [applicationID], [workflowID], [branch] if valid values are passed.
  Future<List<BuildModel>> getAllBuilds(
    String token, {
    String? applicationID,
    String? workflowID,
    String? branch,
  });

  /// Starts new build. [applicatioID], [workflowID] and [branch] must not be null.
  Future<String> startNewBuild(
    String token, {
    required String applicationID,
    required String workflowID,
    String? branch,
    Map<String, Object>? environment,
  });

  /// Cancels build with provided [buildID]. Throws [ServerException] if response code is 208(Build already finished).
  Future<bool> cancelBuild(String token, {required String buildID});

  /// Returns build status for provided [buildID].
  Future<BuildModel> getBuildStatus(
    String token, {
    required String buildID,
  });

  /// Adds new application variable with [key] and [value].
  /// [applicationID] and [workflowID] must not be null. 
  /// 
  /// [group] must not be null if application uses YAML configuration.
  Future<void> addVariable(
    String token, {
    required String key,
    required String value,
    required String workflowID,
    required String applicationID,
    String? group,
  });

  /// Updates app variable with [value] having non-null [applicationID], [variableID].
  Future<void> updateVariable(
    String token, {
    required String applicationID,
    required String variableID,
    required String value,
  });

  /// Deletes app variable having [variableID] for [applicationID].
  Future<bool> deleteVariable(
    String token, {
    required String applicationID,
    required String variableID,
  });
}
