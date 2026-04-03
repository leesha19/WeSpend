import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:wespend/framework/dependency_injection/inject.dart';
import 'package:wespend/framework/provider/network/dio/dio_logger.dart';
import 'package:wespend/framework/provider/network/dio/network_interceptor.dart';
import 'package:wespend/framework/provider/network/network.dart';
import 'package:wespend/ui/utils/app_constants.dart';

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

  @LazySingleton(env: [Env.kodyInfoTech])
  DioClient getKodyInfoTechDioClient(DioLogger dioLogger) {
    final dio = Dio(
      BaseOptions(baseUrl: AppConstants.kodyInfoTechUrl, sendTimeout: const Duration(milliseconds: 500000), connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(milliseconds: 500000)),
    );
    if (kDebugMode) {
      dio.interceptors.add(dioLogger);
    }
    dio.interceptors.add(networkInterceptor());
    final client = DioClient(dio);
    return client;
  }

  @LazySingleton(env: [Env.kodyRobots])
  DioClient getKodyRobotsDioClient(DioLogger dioLogger) {
    final dio = Dio(
      BaseOptions(baseUrl: AppConstants.kodyRobotsUrl, sendTimeout: const Duration(milliseconds: 500000), connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(milliseconds: 500000)),
    );
    if (kDebugMode) {
      // dio.interceptors.add(dioLogger);
    }
    dio.interceptors.add(networkInterceptor());
    final client = DioClient(dio);
    return client;
  }

  @LazySingleton(env: [Env.falconTechRobotics])
  DioClient getFalconTechRoboticsDioClient(DioLogger dioLogger) {
    final dio = Dio(
      BaseOptions(baseUrl: AppConstants.falconTechRoboticsUrl, sendTimeout: const Duration(milliseconds: 500000), connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(milliseconds: 500000)),
    );
    if (kDebugMode) {
      // dio.interceptors.add(dioLogger);
    }
    dio.interceptors.add(networkInterceptor());
    final client = DioClient(dio);
    return client;
  }
}
