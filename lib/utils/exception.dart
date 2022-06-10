class ServerException implements Exception {
  final String message;

  const ServerException(this.message);
}

class DatabaseException implements Exception {
  final String message;

  const DatabaseException(this.message);
}
