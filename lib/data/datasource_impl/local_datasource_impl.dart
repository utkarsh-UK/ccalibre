import 'dart:io';

import 'package:ccalibre/data/datasources/local_datasource.dart';
import 'package:ccalibre/data/models/user_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocaDatasourceImpl extends LocalDatasource {
  final FlutterSecureStorage _secureStorage;

  LocaDatasourceImpl(this._secureStorage);

  @override
  Future<UserModel> storeUserData(File file, String username) {
    // TODO: implement storeUserData
    throw UnimplementedError();
  }
}
