import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/data/datasources/application_remote_datasource.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:dartz/dartz.dart';

class ApplicationRepositoryImpl extends ApplicationRepository {
  final ApplicationRemoteDatasource _remoteDatasource;

  ApplicationRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, void>> addVariable(String token,
      {required String key,
      required String value,
      required String workflowID,
      required String applicationID,
      String? group}) async {
    try {
      return Right(
        await _remoteDatasource.addVariable(
          token,
          key: key,
          value: value,
          workflowID: workflowID,
          applicationID: applicationID,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelBuild(String token,
      {required String buildID}) async {
    try {
      return Right(
        await _remoteDatasource.cancelBuild(token, buildID: buildID),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> createNewApplication(
      String token, String repositoryURL) async {
    try {
      return Right(
        await _remoteDatasource.createNewApplication(token, repositoryURL),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteVariable(String token,
      {required String applicationID, required String variableID}) async {
    try {
      return Right(
        await _remoteDatasource.deleteVariable(
          token,
          applicationID: applicationID,
          variableID: variableID,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Application>>> getAllApplications(
      String token) async {
    try {
      return Right(await _remoteDatasource.getAllApplications(token));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Build>>> getAllBuilds(String token,
      {String? applicationID, String? workflowID, String? branch}) async {
    try {
      return Right(await _remoteDatasource.getAllBuilds(token));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Application>> getApplication(
      String token, String applicationID) async {
    try {
      return Right(
        await _remoteDatasource.getApplication(token, applicationID),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Build>> getBuildStatus(String token,
      {required String buildID}) async {
    try {
      return Right(
        await _remoteDatasource.getBuildStatus(token, buildID: buildID),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> startNewBuild(String token,
      {required String applicationID,
      required String workflowID,
      String? branch}) async {
    try {
      return Right(
        await _remoteDatasource.startNewBuild(
          token,
          applicationID: applicationID,
          workflowID: workflowID,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateVariable(String token,
      {required String applicationID,
      required String variableID,
      required String value}) async {
    try {
      return Right(
        await _remoteDatasource.updateVariable(
          token,
          applicationID: applicationID,
          variableID: variableID,
          value: value,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
