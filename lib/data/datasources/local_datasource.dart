import 'dart:io';

import 'package:ccalibre/data/models/user_model.dart';

abstract class LocalDatasource {
  Future<UserModel> storeUserData(File file, String username);
}