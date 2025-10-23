import 'package:dio/dio.dart';
import '../../config.dart';

class ApiClient {
  final Dio dio;

  ApiClient() : dio = Dio(
    BaseOptions(
      baseUrl: backendBaseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}