import 'dart:io';

import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/data/datasources/local_datasource.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:ccalibre/domain/repositories/onboard_repository.dart';
import 'package:dartz/dartz.dart';

class OnboardRepositoryImpl extends OnboardRepository {
  final LocalDatasource _localDatasource;

  OnboardRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, User>> storeUserData(
      File file, String username) async {
    try {
      return Right(await _localDatasource.storeUserData(file, username));
    } on LocalException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }
}
