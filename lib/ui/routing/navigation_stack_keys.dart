import 'package:wespend/framework/utils/extension/string_extension.dart';
import 'package:wespend/ui/utils/theme/app_strings.g.dart';
import 'package:wespend/ui/utils/app_constants.dart';
import 'package:wespend/ui/utils/theme/app_strings.g.dart';
import 'package:wespend/ui/utils/theme/app_strings.g.dart';

class Keys {
  Keys._();

  static Keys keys = Keys._();

  static String get splash => 'splash'.endPointEncrypt;

  static String get error => 'error'.endPointEncrypt;

  static String get login => 'login'.endPointEncrypt;

  static String get dashboard => 'dashboard'.endPointEncrypt;

}

class QueryParam {
  QueryParam._();

  static QueryParam queryParam = QueryParam._();
  static String get id => 'id'.endPointEncrypt;


}

class NavigationStackKeyMapper {
  NavigationStackKeyMapper._();

  List<String> keysList = [];
  String currentKey = '';

  static NavigationStackKeyMapper mapper = NavigationStackKeyMapper._();

  static Map<String, String> keyValueMapper = {
    Keys.splash: 'Splash',
    Keys.error: 'Error',
    Keys.login: 'Login',
    Keys.dashboard: LocaleKeys.keyDashboard,
  };

  static value(String key) => keyValueMapper[key] ?? '';
}
