abstract class Exceptions {
  String get message;
  String get code;
  String get title;

  @override
  String toString() => 'Exception: $message, Code: $code, Title: $title';
}

class NetworkException implements Exceptions {
  @override
  String get message => 'Network error occurred. Please check your connection.';

  @override
  String get code => 'NETWORK_ERROR';

  @override
  String get title => 'Network Error';
}

class ServerException implements Exceptions {
  @override
  String get message => 'Server error occurred. Please try again later.';

  @override
  String get code => 'SERVER_ERROR';

  @override
  String get title => 'Server Error';
}

class AuthenticationException implements Exceptions {
  @override
  String get message => 'Authentication failed. Please check your credentials.';

  @override
  String get code => 'AUTH_ERROR';

  @override
  String get title => 'Authentication Error';
}

class ValidationException implements Exceptions {
  @override
  String get message => 'Validation error occurred. Please check your input.';

  @override
  String get code => 'VALIDATION_ERROR';

  @override
  String get title => 'Validation Error';
}

class UnknownException implements Exceptions {
  final String _message;

  UnknownException(this._message);

  @override
  String get message => _message;

  @override
  String get code => 'UNKNOWN_ERROR';

  @override
  String get title => 'Unknown Error';
}

class TimeoutException implements Exceptions {
  @override
  String get message => 'Request timed out. Please try again later.';

  @override
  String get code => 'TIMEOUT_ERROR';

  @override
  String get title => 'Timeout Error';
}

class PermissionException implements Exceptions {
  @override
  String get message => 'Permission denied. Please check your app settings.';

  @override
  String get code => 'PERMISSION_DENIED';

  @override
  String get title => 'Permission Error';
}

class DatabaseException implements Exceptions {
  @override
  String get message => 'Database error occurred. Please try again later.';

  @override
  String get code => 'DATABASE_ERROR';

  @override
  String get title => 'Database Error';
}

class FileNotFoundException implements Exceptions {
  @override
  String get message => 'File not found. Please check the file path.';

  @override
  String get code => 'FILE_NOT_FOUND';

  @override
  String get title => 'File Not Found';
}

class RateLimitException implements Exceptions {
  @override
  String get message => 'Rate limit exceeded. Please try again later.';

  @override
  String get code => 'RATE_LIMIT_EXCEEDED';

  @override
  String get title => 'Rate Limit Error';
}

class ConflictException implements Exceptions {
  @override
  String get message => 'Conflict error occurred. Please resolve the conflict.';

  @override
  String get code => 'CONFLICT_ERROR';

  @override
  String get title => 'Conflict Error';
}

