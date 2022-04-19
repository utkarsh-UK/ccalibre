import 'package:ccalibre/core/utils/failure.dart';

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
}
