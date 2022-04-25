import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:dartz/dartz.dart';

abstract class ApplicationRepository {
  /// Returns all the applications added in codemagic.
  Future<Either<Failure, List<Application>>> getAllApplications(String token);

  /// Returns application details for given [applicationID].
  Future<Either<Failure, Application>> getApplication(
      String token, String applicationID);

  /// Creates new application with given [repositoryURL].
  Future<Either<Failure, void>> createNewApplication(
      String token, String repositoryURL);

  /// Retrieves all builds for given user. Provide either of [applicationID]/[workflowId]/[branch] for filtering builds.
  Future<Either<Failure, List<Build>>> getAllBuilds(
    String token, {
    String? applicationID,
    String? workflowID,
    String? branch,
  });

  /// Starts new build for given [applicationID], [workflowID] and [branch].
  /// Provide [environment] to override variables in workflow.   
  Future<Either<Failure, String>> startNewBuild(
    String token, {
    required String applicationID,
    required String workflowID,
    String? branch,
    Map<String, Object>? environment,
  });

  /// Cancels build for given [buildID].
  Future<Either<Failure, bool>> cancelBuild(String token,
      {required String buildID});

  /// Cancels build for given [buildID].
  Future<Either<Failure, Build>> getBuildStatus(
    String token, {
    required String buildID,
  });

  /// Adds new application variable with given [key] and [value].
  Future<Either<Failure, void>> addVariable(
    String token, {
    required String key,
    required String value,
    required String workflowID,
    required String applicationID,
    String? group,
  });

  /// Updates variable with new [value] for given [applicationID] and [variableID].
  Future<Either<Failure, void>> updateVariable(
    String token, {
    required String applicationID,
    required String variableID,
    required String value,
  });

  /// Updates variable for given [applicationID] and [variableID].
  Future<Either<Failure, bool>> deleteVariable(
    String token, {
    required String applicationID,
    required String variableID,
  });
}
