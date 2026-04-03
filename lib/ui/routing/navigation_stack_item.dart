import 'package:freezed_annotation/freezed_annotation.dart';
part 'navigation_stack_item.freezed.dart';

@freezed
class NavigationStackItem with _$NavigationStackItem {
  const factory NavigationStackItem.splash() = NavigationStackItemSplashPage;
  const factory NavigationStackItem.error() = NavigationStackItemErrorPage;
  const factory NavigationStackItem.login() = NavigationStackItemLoginPage;

  const factory NavigationStackItem.dashboard() = NavigationStackItemDashboardPage;
 }