import 'package:dio/dio.dart';
import '../error/exceptions.dart';
import '../constants/api_constants.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      responseType: ResponseType.json,
      headers: ApiConstants.defaultHeaders,
    );
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
          try {
        final response = await dio.get(path, queryParameters: queryParameters);
        return response;
      } on DioException catch (e) {
        throw ServerException(_handleDioError(e));
      }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connection Timeout";
      case DioExceptionType.badResponse:
        return "Server Error: ${error.response?.statusCode}";
      case DioExceptionType.cancel:
        return "Request Cancelled";
      case DioExceptionType.unknown:
        return "Unknown Error: ${error.message}";
      default:
        return "Unexpected Error";
    }
  }
}
