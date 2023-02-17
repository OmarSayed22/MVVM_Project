import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_advanced/data/network/failure.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

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

class ResponseCode {
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
  static String success = AppStringsManager.success.tr();

  //The request succeeded.
  static String noContent = AppStringsManager.noContent.tr();

  //There is no content to send for this request, but the headers may be useful.
  // The user agent may update its cached headers for this resource with the new ones.
  static String badRequest = AppStringsManager.badRequest.tr();

  //The server cannot or will not process the request due to something
  // that is perceived to be a client error (e.g., malformed request syntax,
  // invalid request message framing, or deceptive request routing).
  static String forbidden = AppStringsManager.forbidden.tr();

  // The client does not have access rights to the content; that is, it is
  // unauthorized, so the server is refusing to give the requested resource.
  // Unlike 401 Unauthorized, the client's identity is known to the server.
  static String unauthorised = AppStringsManager.unauthorised.tr();

  //Although the HTTP standard specifies "unauthorized", semantically this
  // response means "unauthenticated". That is, the client must authenticate
  // itself to get the requested response.
  static String notFound = AppStringsManager.notFound.tr();

  //The server cannot find the requested resource. In the browser, this means
  // the URL is not recognized. In an API, this can also mean that the endpoint
  // is valid but the resource itself does not exist. Servers may also send this
  // response instead of 403 Forbidden to hide the existence of a resource from
  // an unauthorized client. This response code is probably the most well known
  // due to its frequent occurrence on the web.
  static String internetServerError =
      AppStringsManager.internetServerError.tr();

  //The server has encountered a situation it does not know how to handle.
  static String connectTimeout = AppStringsManager.connectTimeout.tr();
  static String cancel = AppStringsManager.cancel.tr();
  static String receiveTimeout = AppStringsManager.receiveTimeout.tr();
  static String sendTimeout = AppStringsManager.sendTimeout.tr();
  static String cacheError = AppStringsManager.cacheError.tr();
  static String noInternetConnection =
      AppStringsManager.noInternetConnection.tr();
  static String unknown = AppStringsManager.unknown.tr();
}

extension DataSourcesExtension on DataSources {
  getFailure() {
    switch (this) {
      case DataSources.success:
        return Failure(ResponseCode.success, ResponseMessage.success);

      case DataSources.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);

      case DataSources.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);

      case DataSources.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);

      case DataSources.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);

      case DataSources.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);

      case DataSources.internetServerError:
        return Failure(ResponseCode.internetServerError,
            ResponseMessage.internetServerError);

      case DataSources.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);

      case DataSources.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);

      case DataSources.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);

      case DataSources.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);

      case DataSources.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);

      case DataSources.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSources.unknown:
        return Failure(ResponseCode.unknown, ResponseMessage.unknown);
    }
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
