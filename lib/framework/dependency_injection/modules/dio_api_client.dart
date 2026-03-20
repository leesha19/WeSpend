import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @LazySingleton(env: [Env.development])
  DioClient getDevelopmentDioClient(DioLogger dioLogger) {
    final dio = Dio(
      BaseOptions(baseUrl: AppConstants.developmentUrl, sendTimeout: const Duration(milliseconds: 500000), connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(milliseconds: 500000)),
    );
    if (kDebugMode) {
      dio.interceptors.add(dioLogger);
    }
    dio.interceptors.add(networkInterceptor());
    final client = DioClient(dio);
    return client;
  }
}
