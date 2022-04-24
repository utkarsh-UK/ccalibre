import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:dartz/dartz.dart';

abstract class ApplicationRepository {
  Future<Either<Failure, List<Application>>> getAllApplications(String token);

  Future<Either<Failure, Application>> getApplication(
      String token, String applicationID);

  Future<Either<Failure, void>> createNewApplication(
      String token, String repositoryURL);

  Future<Either<Failure, List<Build>>> getAllBuilds(
    String token, {
    String? applicationID,
    String? workflowID,
    String? branch,
  });

  Future<Either<Failure, String>> startNewBuild(
    String token, {
    required String applicationID,
    required String workflowID,
    String? branch,
    Map<String, Object>? environment,
  });

  Future<Either<Failure, bool>> cancelBuild(String token,
      {required String buildID});

  Future<Either<Failure, Build>> getBuildStatus(
    String token, {
    required String buildID,
  });

  Future<Either<Failure, void>> addVariable(
    String token, {
    required String key,
    required String value,
    required String workflowID,
    required String applicationID,
    String? group,
  });

  Future<Either<Failure, void>> updateVariable(
    String token, {
    required String applicationID,
    required String variableID,
    required String value,
  });

  Future<Either<Failure, bool>> deleteVariable(
    String token, {
    required String applicationID,
    required String variableID,
  });
}
