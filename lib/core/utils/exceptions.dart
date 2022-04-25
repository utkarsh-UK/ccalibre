/// Custom class to catch ServerExceptions. Deals with network/api calls.
/// 
/// [message] field provides reason of the exception in short.
class ServerException implements Exception {
  final String message;

  ServerException({
    this.message = 'Could not process your request at the moment.',
  });
}

/// Custom class to catch LocalExceptions. Deals with device/local data management.
/// 
/// [message] field provides reason of the exception in short.
class LocalException implements Exception {
  final String message;

  LocalException({
    this.message = 'Could not process your request at the moment.',
  });
}
