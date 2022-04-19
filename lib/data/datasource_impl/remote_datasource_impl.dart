import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/data/datasources/remote_datasource.dart';
import 'package:ccalibre/data/models/application_model.dart';
import 'package:ccalibre/data/models/build_model.dart';
import 'package:dio/dio.dart';

class RemoteDatasourceImpl extends RemoteDatasource {
  final Dio _dio;

  RemoteDatasourceImpl(this._dio);

  @override
  Future<void> addVariable(String token,
      {required String key,
      required String value,
      required String workflowID,
      required String applicationID,
      String? group}) {
    // TODO: implement addVariable
    throw UnimplementedError();
  }

  @override
  Future<bool> cancelBuild(String token, {required String buildID}) {
    // TODO: implement cancelBuild
    throw UnimplementedError();
  }

  @override
  Future<void> createNewApplication(String token, String repositoryURL) {
    // TODO: implement createNewApplication
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteVariable(String token,
      {required String applicationID, required String variableID}) {
    // TODO: implement deleteVariable
    throw UnimplementedError();
  }

  @override
  Future<List<ApplicationModel>> getAllApplications(String token) async {
    try {

      final response = await _dio.get(
        '/apps',
        options: Options(headers: {'x-auth-token': token}),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        return (data['applications'] as List<dynamic>)
            .map<ApplicationModel>((app) => ApplicationModel.fromJSON(app))
            .toList();
      } else {
        throw ServerException(message: response.statusMessage!);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<BuildModel>> getAllBuilds(String token,
      {String? applicationID, String? workflowID, String? branch}) {
    // TODO: implement getAllBuilds
    throw UnimplementedError();
  }

  @override
  Future<ApplicationModel> getApplication(String token, String applicationID) {
    // TODO: implement getApplication
    throw UnimplementedError();
  }

  @override
  Future<BuildModel> getBuildStatus(String token, {required String buildID}) {
    // TODO: implement getBuildStatus
    throw UnimplementedError();
  }

  @override
  Future<void> startNewBuild(String token,
      {required String applicationID,
      required String workflowID,
      String? branch}) {
    // TODO: implement startNewBuild
    throw UnimplementedError();
  }

  @override
  Future<void> updateVariable(String token,
      {required String applicationID,
      required String variableID,
      required String value}) {
    // TODO: implement updateVariable
    throw UnimplementedError();
  }
}
