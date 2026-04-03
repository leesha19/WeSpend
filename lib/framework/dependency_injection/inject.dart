import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:wespend/framework/dependency_injection/inject.config.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureMainDependencies({required String environment}) async => GetItInjectableX(getIt).init(environment: environment);

abstract class Env {
  static const development = 'development';
  static const kodyInfoTech = 'kodyInfoTech';
  static const kodyRobots = 'kodyRobots';
  static const falconTechRobotics = 'falconTechRobotics';
  static const List<String> environments = [Env.development, Env.kodyInfoTech, Env.kodyRobots, Env.falconTechRobotics];
}
