import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

import '../exceptions/exceptions.dart';

const _defaultConnectTimeout = Duration(seconds: 60);
const _defaultReceiveTimeout = Duration(seconds: 60);

Logger logger = Logger();

class DioClient {
  late Dio _dio;
  late final List<Interceptor>? interceptors;

  DioClient(Dio dio, {this.interceptors}) {
    _dio = dio;
    _dio
      ..options.baseUrl = dotenv.env['API_URL']!
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: requestInterceptor,
        onResponse: responseInterceptor,
        onError: errorInterceptor,
      ),
    );
  }

  requestInterceptor(RequestOptions options, RequestInterceptorHandler onRequest) {
    onRequest.next(options);

    /* logger.i(options.data); */

    return options;
  }

  responseInterceptor(Response response, ResponseInterceptorHandler onResponse) {
    onResponse.next(response);
    //logger.i(response.statusCode);
    // logger.i("${response.realUri} ${response.data.toString()}");
    return response;
  }

  errorInterceptor(DioError error, ErrorInterceptorHandler onError) {
    onError.next(error);
    /*  logger.e(error.error);
    logger.e(error.message);*/
    return error;
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(uri);
      final statusCode = response.statusCode;
      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data == null) {
          return;
        } else {
          // logger.i("$uri ${response.data}");
          return response.data;
        }
      } else {
        throw AppException(code: response.statusCode, message: "${response.data}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // logger.i("URL ==> $uri");

      Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final statusCode = response.statusCode;
      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data == null) {
          return;
        } else {
          // debugPrint("POST $uri ==> ${response.data}");
          return response.data;
        }
      } else {
        throw AppException(code: response.statusCode, message: "${response.data}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      final statusCode = response.statusCode;

      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data.isEmpty) {
          return;
        } else {
          // debugPrint("${response.data}");

          return response.data;
        }
      } else {
        throw AppException(code: response.statusCode, message: "${response.data}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final statusCode = response.statusCode;

      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data.isEmpty) {
          return;
        } else {
          // debugPrint("${response.data}");
          return response.data;
        }
      } else {
        throw AppException(code: response.statusCode, message: "${response.data}");
      }
    } catch (e) {
      //  logger.i("ERROR ===> $e");
      rethrow;
    }
  }
}
