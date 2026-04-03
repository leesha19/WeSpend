import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wespend/framework/provider/network/api_end_points.dart';
import 'package:wespend/framework/utils/session.dart';
import 'package:wespend/ui/routing/navigation_stack_item.dart';
import 'package:wespend/ui/routing/navigation_stack_keys.dart';
import 'package:wespend/ui/routing/route_manager.dart';
import 'package:wespend/ui/routing/stack.dart';
import 'package:wespend/ui/utils/app_constants.dart';
import 'package:wespend/ui/utils/app_enums.dart';

@injectable
class MainRouterInformationParser
    extends RouteInformationParser<NavigationStack> {
  WidgetRef ref;
  BuildContext context;

  MainRouterInformationParser(
    @factoryParam this.ref,
    @factoryParam this.context,
  );

  @override
  Future<NavigationStack> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    List<String> queryParam = [];
    List<String> tempUrlList = routeInformation.uri.toString().split('/');
    tempUrlList.removeAt(0);
    List<String> tempPathList = [];
    for (var element in tempUrlList) {
      tempPathList.add(element.split('?').first);
      if (element.split('?').length > 1) {
        queryParam.add(element.split('?').last);
      }
    }
    String mainUrl =
        '/${tempPathList.join('/')}${queryParam.isNotEmpty ? '?${queryParam.join('&')}' : ''}';
    AppConstants.constant.showLog('........URL......$mainUrl');
    final Uri uri = Uri.parse(mainUrl);
    final queryParams = uri.queryParameters;

    AppConstants.constant.showLog('........queryParams....$queryParams');
    NavigationStackKeyMapper.mapper.keysList = uri.pathSegments;
    final items = <NavigationStackItem>[];
    AppConstants.constant.showLog('Path Segments-> ${uri.pathSegments}');

    ///Will remove all the empty path from segments
    RouteManager.route.removeEmptyPath(uri.pathSegments);

    ///To add error page at the end and return no widget if error is found
    bool hasError = false;

    ///To add error page at the end and return no widget if error is found
    bool isAuthenticated = true;

    ///Will check validation for routes
    var pathValidation = RouteManager.route.checkPathValidation();

    // TODO: Add API integration later
    // if (Session.userAccessToken.isNotEmpty) {
    //   await ref
    //       .read(profileController)
    //       .getProfileDetail(context, ref, isNotify: false)
    //       .then((value) async {
    //     if (ref
    //         .read(profileController)
    //         .profileDetailState
    //         .success
    //         ?.status ==
    //         ApiEndPoints.apiStatus_200) {
    //       await ref
    //           .read(drawerController)
    //           .getSideMenuListAPI(context, isNotify: false);
    //     }
    //   });
    // }

    for (var i = 0; i < uri.pathSegments.length; i = i + 1) {
      ///To add error page at the end and return no widget if error is found
      hasError = !pathValidation.isRouteValid;
      isAuthenticated = pathValidation.isAuthenticated;
      final key = uri.pathSegments[i];

      getKeysHandler(items, key, queryParams, uri.pathSegments);
    }

    if (items.isEmpty) {
      const fallback = NavigationStackItem.splash();
      if (items.isNotEmpty && items.first is NavigationStackItemSplashPage) {
        items[0] = fallback;
      } else {
        items.insert(0, fallback);
      }
    }

    return NavigationStack(items);
  }

  Map<String, Function()> keysHandler(
    List<NavigationStackItem> items,
    Map<String, String> queryParams,
  ) => <String, Function()>{
    Keys.splash: () => items.add(const NavigationStackItem.splash()),
    Keys.error: () {
      showLog('Keys.error Keys.error}');
      items.add(const NavigationStackItem.error());
    },
    Keys.login: () {
      queryParams[QueryParam.id];
      items.add(const NavigationStackItem.login());
    },


    Keys.dashboard: () => items.add(const NavigationStackItem.dashboard()),

  };

  void getKeysHandler(
    List<NavigationStackItem> items,
    String key,
    Map<String, String> queryParams,
    List<String> pathSegments,
  ) {
    NavigationStackKeyMapper.mapper.currentKey = key;
    showLog('current key ${key}');
    final handler = keysHandler(items, queryParams)[key];
    if (handler != null) {
      handler();
    } else {
      showLog('No handler found for key: $key');
    }
  }

  ///THIS IS IMPORTANT: Here we restore the web history

  @override
  RouteInformation? restoreRouteInformation(NavigationStack configuration) {
    final location = configuration.items.fold<String>(
      '',
          (previousValue, element) {
        return previousValue +
            element.when(
              splash: () => '/',
              error: () => '/${Keys.error}',
              login: () => '/${Keys.login}',
              dashboard: () => '/${Keys.dashboard}',
            );
      },
    );

    Uri routeUrl = Uri.parse(location.isEmpty ? '/' : location);

    return RouteInformation(uri: routeUrl);
  }
}
