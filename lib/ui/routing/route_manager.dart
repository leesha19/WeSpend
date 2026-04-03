import 'package:wespend/framework/utils/extension/context_extension.dart';
import 'package:wespend/framework/utils/session.dart';
import 'package:wespend/ui/routing/delegate.dart';
import 'package:wespend/ui/routing/navigation_stack_keys.dart';

class RouteManager {
  ///Singleton Class for [RouteManger]
  RouteManager._();

  ///Instance [route] to call methods for [RouteManager]
  static RouteManager route = RouteManager._();

  ///Path Segments to display a path after removing empty paths
  List<String> pathSegments = [];

  ///To remove any empty path after [/] in Path Segments
  void removeEmptyPath(List<String> segments) {
    pathSegments = segments.toList();
    pathSegments.removeWhere((element) => element.trim().isEmpty);
  }

  ///To check if the current route is valid
  RouteValidator checkPathValidation() {
    ///If mobile then always return true
    if (globalNavigatorKey.currentContext?.isMobileScreen ?? false) {
      return const RouteValidator(isAuthenticated: true, isRouteValid: true);
    }

    ///If empty then always return true
    if (pathSegments.isEmpty) {
      return const RouteValidator(isAuthenticated: true, isRouteValid: true);
    }

    ///Create a path without any parameters
    String path = pathSegments.join('/');

    ///Will check authentication
    bool isAuthenticated = Session.userAccessToken.isNotEmpty;

    ///Will check validation and return accordingly

    return getPathValidator(path, isAuthenticated, pathSegments.last);
  }

  // Map<String, RouteValidator Function()> routeHandlers(String path, bool isAuthenticated) => <String, RouteValidator Function()>{
  //   Keys.splash: () => RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: path == Keys.splash),
  //   Keys.dashboard: () => RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: path == Keys.dashboard),
  //   Keys.login: () => RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: path == Keys.login),
  //   Keys.showCms: () => RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: path == '${Keys.profile}/${Keys.showCms}'),
  //
  // };
  Map<String, RouteValidator Function()> routeHandlers(String path, bool isAuthenticated,) => <String, RouteValidator Function()>{
    Keys.splash: () => RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: path == Keys.splash,),
    // Keys.dashboard: () => RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: path.startsWith(Keys.dashboard),),
    // Keys.login: () => RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: path == Keys.login,),
  };



  // RouteValidator getPathValidator(String path, bool isAuthenticated, String route) {
  //   final handler = routeHandlers(path, isAuthenticated)[route];
  //   return handler != null ? handler() : RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: false);
  // }

  RouteValidator getPathValidator(String path, bool isAuthenticated, String route) {
    for (final entry in routeHandlers(path, isAuthenticated).values) {
      final result = entry();
      if (result.isRouteValid) return result;
    }
    return RouteValidator(isAuthenticated: isAuthenticated, isRouteValid: false);
  }


}

class RouteValidator {
  final bool isRouteValid;
  final bool isAuthenticated;

  const RouteValidator({this.isRouteValid = false, this.isAuthenticated = false});
}
