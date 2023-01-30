import 'package:dio/dio.dart';
import 'package:flutter_advanced/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handlerErr(error);
    } else {
      failure = DataSources.unknown.getFailure();
    }
  }
}

Failure _handlerErr(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSources.connectTimeout.getFailure();
    case DioErrorType.sendTimeout:
      return DataSources.sendTimeout.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSources.receiveTimeout.getFailure();
    case DioErrorType.response:
      if (error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            error.response!.statusCode!, error.response!.statusMessage!);
      } else {
        return DataSources.unknown.getFailure();
      }
    case DioErrorType.cancel:
      return DataSources.cancel.getFailure();
    case DioErrorType.other:
      return DataSources.unknown.getFailure();
  }
}

enum DataSources {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internetServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown;
}

class ResponseCod {
  static const int success = 200;

  //The request succeeded.
  static const int noContent = 204;

  //There is no content to send for this request, but the headers may be useful.
  // The user agent may update its cached headers for this resource with the new ones.
  static const int badRequest = 400;

  //The server cannot or will not process the request due to something
  // that is perceived to be a client error (e.g., malformed request syntax,
  // invalid request message framing, or deceptive request routing).
  static const int forbidden = 403;

  // The client does not have access rights to the content; that is, it is
  // unauthorized, so the server is refusing to give the requested resource.
  // Unlike 401 Unauthorized, the client's identity is known to the server.
  static const int unauthorised = 401;

  //Although the HTTP standard specifies "unauthorized", semantically this
  // response means "unauthenticated". That is, the client must authenticate
  // itself to get the requested response.
  static const int notFound = 404;

  //The server cannot find the requested resource. In the browser, this means
  // the URL is not recognized. In an API, this can also mean that the endpoint
  // is valid but the resource itself does not exist. Servers may also send this
  // response instead of 403 Forbidden to hide the existence of a resource from
  // an unauthorized client. This response code is probably the most well known
  // due to its frequent occurrence on the web.
  static const int internetServerError = 500;

  //The server has encountered a situation it does not know how to handle.
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
}

class ResponseMessage {
  static const String success = "success";

  //The request succeeded.
  static const String noContent = "There is no content";

  //There is no content to send for this request, but the headers may be useful.
  // The user agent may update its cached headers for this resource with the new ones.
  static const String badRequest = "Bad request , try again later";

  //The server cannot or will not process the request due to something
  // that is perceived to be a client error (e.g., malformed request syntax,
  // invalid request message framing, or deceptive request routing).
  static const String forbidden =
      "The client does not have access rights to the content";

  // The client does not have access rights to the content; that is, it is
  // unauthorized, so the server is refusing to give the requested resource.
  // Unlike 401 Unauthorized, the client's identity is known to the server.
  static const String unauthorised =
      "The client is an unauthorized, try again later";

  //Although the HTTP standard specifies "unauthorized", semantically this
  // response means "unauthenticated". That is, the client must authenticate
  // itself to get the requested response.
  static const String notFound =
      "The server cannot find the requested resource, try again later";

  //The server cannot find the requested resource. In the browser, this means
  // the URL is not recognized. In an API, this can also mean that the endpoint
  // is valid but the resource itself does not exist. Servers may also send this
  // response instead of 403 Forbidden to hide the existence of a resource from
  // an unauthorized client. This response code is probably the most well known
  // due to its frequent occurrence on the web.
  static const String internetServerError =
      "Some thing went wrong with the server, please try again later";

  //The server has encountered a situation it does not know how to handle.
  static const String connectTimeout =
      "timed out error, please try again later";
  static const String cancel = "Request was canceled, please try again later";
  static const String receiveTimeout =
      "timed out error, please try again later";
  static const String sendTimeout = "timed out error, please try again later";
  static const String cacheError = "Cache error, please try again later";
  static const String noInternetConnection =
      "Please check your internet connection";
  static const String unknown =
      "Some thing went wrong with the server, please try again later";
}

extension DataSourcesExtension on DataSources {
  getFailure() {
    switch (this) {
      case DataSources.success:
        return Failure(ResponseCod.success, ResponseMessage.success);

      case DataSources.noContent:
        return Failure(ResponseCod.noContent, ResponseMessage.noContent);

      case DataSources.badRequest:
        return Failure(ResponseCod.badRequest, ResponseMessage.badRequest);

      case DataSources.forbidden:
        return Failure(ResponseCod.forbidden, ResponseMessage.forbidden);

      case DataSources.unauthorised:
        return Failure(ResponseCod.unauthorised, ResponseMessage.unauthorised);

      case DataSources.notFound:
        return Failure(ResponseCod.notFound, ResponseMessage.notFound);

      case DataSources.internetServerError:
        return Failure(ResponseCod.internetServerError,
            ResponseMessage.internetServerError);

      case DataSources.connectTimeout:
        return Failure(
            ResponseCod.connectTimeout, ResponseMessage.connectTimeout);

      case DataSources.cancel:
        return Failure(ResponseCod.cancel, ResponseMessage.cancel);

      case DataSources.receiveTimeout:
        return Failure(
            ResponseCod.receiveTimeout, ResponseMessage.receiveTimeout);

      case DataSources.sendTimeout:
        return Failure(ResponseCod.sendTimeout, ResponseMessage.sendTimeout);

      case DataSources.cacheError:
        return Failure(ResponseCod.cacheError, ResponseMessage.cacheError);

      case DataSources.noInternetConnection:
        return Failure(ResponseCod.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSources.unknown:
        return Failure(ResponseCod.unknown, ResponseMessage.unknown);
    }
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
