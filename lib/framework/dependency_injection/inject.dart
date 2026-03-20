import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureMainDependencies({required String environment}) async => GetItInjectableX(getIt).init(environment: environment);

abstract class Env {
  static const development = 'development';
  static const List<String> environments = [Env.development];
}
