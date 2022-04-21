import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:dio/dio.dart';

enum HttpRequestType { get, post, delete }

class Helpers {
  static String convertFailureToString(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    }
    if (failure is LocalFailure) {
      return failure.message;
    }

    return "Unkown Error Occured";
  }

  static Future<Map<String, dynamic>?> sendRequest(
      Dio dio, HttpRequestType type, String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      Response _response;

      switch (type) {
        case HttpRequestType.get:
          _response = await dio.get(
            path,
            queryParameters: queryParams,
            options: Options(headers: headers),
          );
          break;

        case HttpRequestType.post:
          _response = await dio.post(path, queryParameters: queryParams);
          break;

        case HttpRequestType.delete:
          _response = await dio.delete(path, queryParameters: queryParams);
          break;

        default:
          return null;
      }

      if (_response.statusCode == 200) {
        return _response.data as Map<String, dynamic>;
      } else {
        throw ServerException(message: _response.statusMessage!);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
