import 'dart:io';

import 'package:ccalibre/data/models/user_model.dart';

abstract class LocalDatasource {
  /// Extractes token from given [file] and stores token and github [username] in device.
  Future<UserModel> storeUserData(File file, String username);

  /// Retrieves token and github username from device. Returns null if no user found.
  Future<UserModel?> getUserData();
}