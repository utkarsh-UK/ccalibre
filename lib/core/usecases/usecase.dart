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
  const Params();

  @override
  List<Object> get props => [];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
