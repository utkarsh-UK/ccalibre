import 'dart:io';

import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardRepository {
  Future<Either<Failure, User>> storeUserData(File file, String username);
}
