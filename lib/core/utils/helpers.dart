import 'dart:convert';

import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum HttpRequestType { get, post, delete }

class Helpers {
  /// Returns String [message] from [failure] object.
  static String convertFailureToString(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    }
    if (failure is LocalFailure) {
      return failure.message;
    }

    return "Unkown Error Occured";
  }

  /// Sends request with [dio] object. Throws [ServerException] with [message] including the error reason.
  ///
  /// Accepts [type] for request type (get, post, delete).
  /// 
  /// [path] - appends given string to baseURl.
  /// 
  /// [queryParams] - query parameters to be passed.
  /// 
  /// [headers] - provides headers to the request.
  /// 
  /// [isResponseListType] -  Pass as true when API response is of type List<>. Method will return {'data': List<>} as final return.
  /// 
  /// [data] - JSON data to be passed to the request. Method will encode [data] with [jsonEncode].
  static Future<Map<String, dynamic>?> sendRequest(
    Dio dio,
    HttpRequestType type,
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    bool isResponseListType = false,
    Map<String, dynamic> data = const {},
  }) async {
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
          _response = await dio.post(
            path,
            queryParameters: queryParams,
            options: Options(headers: headers),
            data: jsonEncode(data),
          );
          break;

        case HttpRequestType.delete:
          _response = await dio.delete(path, queryParameters: queryParams);
          break;

        default:
          return null;
      }

      if (_response.statusCode == 200) {
        // Response is of List Type. Convert to Map with added key [data].
        if (isResponseListType) return {'data': _response.data};

        return _response.data as Map<String, dynamic>;
      } else if (_response.statusCode == 208) {
        throw ServerException(message: 'Build has already finished');
      } else {
        throw ServerException(message: _response.statusMessage!);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  /// Returns background color for build card depending on the [status].
  static Color getCardBackgroundColorByBuildStatus(String status) {
    switch (status) {
      case 'finished':
        return const Color(0xFFA5FFB0);
      case 'failed':
      case 'canceled':
        return const Color(0xFFFC8EA4);
      case 'building':
        return const Color(0xFFFCC48B);

      default:
        return const Color(0xFFFCC48B);
    }
  }

  /// Returns border color for build card depending on the [status].
  static Color getCardBorderColorByBuildStatus(String status) {
    switch (status) {
      case 'finished':
        return const Color(0xFF6BCB77);
      case 'failed':
      case 'canceled':
        return const Color(0xFFED1843);
      case 'building':
        return const Color(0xFFF99B3D);

      default:
        return const Color(0xFFF99B3D);
    }
  }

  /// Returns status message for build card depending on the [status].
  static String getBuildHistoryFooterStatus(String status) {
    switch (status) {
      case 'finished':
        return '';
      case 'failed':
        return 'Failed';
      case 'canceled':
        return 'Cancelled';
      case 'building':
        return 'Started';

      default:
        return 'Started';
    }
  }

  /// Returns build status message for build tile depending on the [status].
  static String getBuildStatus(String status) {
    switch (status) {
      case 'finished':
        return 'Finished in ';
      case 'failed':
        return 'Failed, took ';
      case 'canceled':
        return 'Cancelled ';
      case 'building':
        return '$status, started ';

      default:
        return '$status, started ';
    }
  }

  /// Returns action button text for build tile depending on the [status].
  static String getBuildActionButtonText(String status) {
    switch (status) {
      case 'finished':
      case 'failed':
      case 'canceled':
        return 'Run Again';
      case 'building':
        return 'Cancel';

      default:
        return 'Cancel';
    }
  }

  /// Returns action button color for build tile depending on the [status].
  static Color getBuildActionButtonColor(String status) {
    switch (status) {
      case 'finished':
      case 'failed':
      case 'canceled':
        return const Color(0xFF0A58FF);
      case 'building':
        return const Color(0xFFED1843);

      default:
        return const Color(0xFFED1843);
    }
  }

  /// Returns action button color for build tile depending on the [status].
  static String getBuildTimeFooter(
    String status,
    DateTime start,
    DateTime end,
  ) {
    switch (status) {
      case 'finished':
        return end.getTimeDiff(start);
      case 'failed':
      case 'canceled':
      case 'building':
        return end.getTimeAgoFromCurrent();
      default:
        return end.getTimeAgoFromCurrent();
    }
  }

  /// Returns build time difference depending on the [status].
  /// 
  /// [start] and [end] date must not be null.
  static String getBuildTime(
    String status,
    DateTime start,
    DateTime end,
  ) {
    switch (status) {
      case 'finished':
      case 'failed':
        return end.getTimeDiff(start);
      case 'canceled':
        return end.getTimeAgoFromCurrent();
      case 'building':
        return start.getTimeAgoFromCurrent();

      default:
        return start.getTimeAgoFromCurrent();
    }
  }
}
