import 'dart:io';

import 'package:ccalibre/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../utils/failure.dart';

/// Abstract UseCase class with contract to implement call method.
///
/// Implementor has to provide implementation for call() with [params].
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Custom class to hold parameters of UseCase's call().
class Params extends Equatable {
  final String? token;
  final String? applicationID;
  final String? workflowID;
  final String? buildID;
  final String? variableKey;
  final String? variableValue;
  final User? user;
  final String? githubUsername;
  final File? tokenFile;

  const Params({
    this.token,
    this.user,
    this.applicationID,
    this.workflowID,
    this.buildID,
    this.tokenFile,
    this.githubUsername,
    this.variableKey,
    this.variableValue,
  });

  @override
  List<Object> get props => [user!, githubUsername!];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
