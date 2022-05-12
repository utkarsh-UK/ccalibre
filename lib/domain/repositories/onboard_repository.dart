import 'dart:io';

import 'package:ccalibre/core/utils/failure.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardRepository {
  /// Extractes token from given [file] and stores token and github [username] in device.
  /// 
  /// If [token] is non-null, [file] will be ignored and [token] will be stored directly.
  Future<Either<Failure, User>> storeUserData(File file, String username, {String? token});
  
  /// Retrieves token and github username from device. Returns null if no user found.
  Future<Either<Failure, User?>> getUserData();
}
