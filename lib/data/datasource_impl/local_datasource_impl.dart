import 'dart:convert';
import 'dart:io';

import 'package:ccalibre/core/utils/constants.dart';
import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/data/datasources/local_datasource.dart';
import 'package:ccalibre/data/models/user_model.dart';
import 'package:ccalibre/data/services/storage_service.dart';

class LocalDatasourceImpl extends LocalDatasource {
  final SecuredStorageService _securedStorageService;

  LocalDatasourceImpl(this._securedStorageService);

  @override
  Future<UserModel> storeUserData(File file, String username,
      {String? token}) async {
    try {
      late String finalToken;

      if (token != null) {
        finalToken = token;
      } else {
        final String fileContents = file.readAsStringSync();
        finalToken = fileContents.trim();
      }
      
      final user = UserModel.fromRaw(finalToken, username);

      await _securedStorageService.writeSecured(
        Constants.apiTokenKey,
        jsonEncode(user),
      );

      return user;
    } on FileSystemException {
      throw LocalException(message: 'Error while reading file');
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> getUserData() async {
    try {
      final String? userDataString =
          await _securedStorageService.readSecured(Constants.apiTokenKey);

      if (userDataString == null) return null;

      final Map<String, dynamic> parsedUser =
          jsonDecode(userDataString) as Map<String, dynamic>;

      return UserModel.fromJSON(parsedUser);
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }
}
