import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://dummyjson.com',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
            contentType: 'application/json',
          ),
        ) {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  // Tambahkan fungsi helper ini agar bisa dipanggil langsung
  Future<Response> get(String path) async {
    return await dio.get(path);
  }
}

// Instance global
final apiClient = ApiClient();
