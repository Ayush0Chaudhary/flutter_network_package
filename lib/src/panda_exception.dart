class PandaException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  PandaException([this.message, this.prefix, this.url]);
}

class BadRequestException extends PandaException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request | Nhi aya bhaya', url);
}

class FetchDataException extends PandaException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process | Hamse na ho payga', url);
}

class ApiNotRespondingException extends PandaException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responding | Chutiya URL bhai', url);
}

class UnAuthorizedException extends PandaException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized | Bahar se bhaga diya :(', url);
}
