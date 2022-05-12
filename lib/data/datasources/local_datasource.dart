import 'dart:io';

import 'package:ccalibre/data/models/user_model.dart';

abstract class LocalDatasource {
  /// Extractes token from given [file] and stores token and github [username] in device.
  ///
  /// If [token] is non-null, [file] will be ignored and [token] will be stored directly.
  Future<UserModel> storeUserData(File file, String username, {String? token});

  /// Retrieves token and github username from device. Returns null if no user found.
  Future<UserModel?> getUserData();
}