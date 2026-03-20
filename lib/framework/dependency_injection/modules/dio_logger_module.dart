import 'package:injectable/injectable.dart';

@module
abstract class DioLoggerModule {
  @LazySingleton(env: Env.environments)
  DioLogger getDioLogger() {
    final dioLogger = DioLogger();
    return dioLogger;
  }
}
