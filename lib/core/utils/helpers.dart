import 'dart:convert';

import 'package:ccalibre/core/utils/exceptions.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      } else {
        throw ServerException(message: _response.statusMessage!);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

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

  static String getBuildStatus(String status) {
    switch (status) {
      case 'finished':
        return 'Finished in ';
      case 'failed':
        return 'Failed, took ';
      case 'canceled':
        return 'Cancelled';
      case 'building':
        return '$status, started ';

      default:
        return '$status, started ';
    }
  }

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
