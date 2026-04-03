import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wespend/ui/routing/stack.dart';
import 'package:wespend/ui/routing/navigation_stack_item.dart';
import 'package:wespend/ui/splash/splash.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

@injectable
class MainRouterDelegate extends RouterDelegate<NavigationStack>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationStack> {
  final NavigationStack stack;

  MainRouterDelegate(@factoryParam this.stack) {
    stack.addListener(notifyListeners);
  }

  @override
  void dispose() {
    stack.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  final navigatorKey = globalNavigatorKey;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Navigator(
          key: navigatorKey,
          pages: _pages(),

          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            if (stack.items.length <= 1) return false;

            stack.pop();
            return true;
          },
        );
      },
    );
  }

  List<Page> _pages() {
    return stack.items.map((item) {
      return buildPage(item);
    }).toList();
  }

  Page buildPage(NavigationStackItem item) {
    return item.when(
      splash: () => const MaterialPage(child: SplashScreen()),
      error: () => const MaterialPage(child: Scaffold(
        body: Center(child: Text("Error Page")),
      )),
      login: () => const MaterialPage(child: Scaffold(
        body: Center(child: Text("Login Page")),
      )),
      dashboard: () => const MaterialPage(child: Scaffold(
        body: Center(child: Text("Dashboard")),
      )),
    );
  }

  @override
  NavigationStack get currentConfiguration => stack;

  @override
  Future<void> setNewRoutePath(NavigationStack configuration) async {
    stack.items = configuration.items;
  }
}