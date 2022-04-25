import 'dart:math';

import 'package:get/get.dart';

/// Returns height & width percentage based on [this] value.
extension PercentSized on double {
  double get hp => (Get.height * (this / 100));

  double get wp => (Get.width * (this / 100));
}

/// Returns responsive sp value for text sizes.
extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}

/// Returns responsive sp value for text sizes.
extension Capitalization on String {
  String get toTitleCase => replaceFirst(this[0], this[0].toUpperCase());
}

/// Returns file size based on bytes passed.
extension FileSize on int {
  String get sizeInHigherBytes {
    if (this <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    int i = (log(this) / log(1024)).floor();
    return ((this / pow(1024, i)).toStringAsFixed(2)) + ' ' + suffixes[i];
  }
}

/// Returns time difference in ago format
extension DateTimeExtension on DateTime {
  /// Returns past time from current date.
  String getTimeAgoFromCurrent() {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return '${difference.inDays}d ${difference.inHours % 24}h ago';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}d ${difference.inHours % 24}h ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}h ${difference.inMinutes % 60}m ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes}m ${difference.inMinutes % 60}s ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}s ago';
    } else {
      return 'Just now';
    }
  }

  /// Returns difference between start and end date in $time ago format.
  /// 
  /// Accepts [startDate] as starting date. Call on [endDate].
  String getTimeDiffInAgo(DateTime startDate) {
    final difference = this.difference(startDate);

    if ((difference.inDays / 7).floor() >= 1) {
      return '${difference.inDays}d ${difference.inHours % 24}h ago';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}d ${difference.inHours % 24}h ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}h ${difference.inMinutes % 60}m ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes}m ${difference.inMinutes % 60}s ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}s ago';
    } else {
      return '${difference.inSeconds}s ago';
    }
  }

  /// Returns time difference between start and end date in hh:mm format.
  String getTimeDiff(DateTime startDate) {
    final difference = this.difference(startDate);

    if ((difference.inDays / 7).floor() >= 1) {
      return '${difference.inDays}d ${difference.inHours % 24}h';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}d ${difference.inHours % 24}h';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}d';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}h ${difference.inMinutes % 60}m';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes}m ${difference.inMinutes % 60}s';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}s';
    } else {
      return '${difference.inSeconds}s';
    }
  }
}
