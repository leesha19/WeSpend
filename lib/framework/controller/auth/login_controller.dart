import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wespend/framework/dependency_injection/inject.dart';

import '../../provider/network/network.dart';

final loginController = ChangeNotifierProvider((ref) => getIt<LoginController>());

@injectable
class LoginController extends ChangeNotifier {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

   bool? mode = true;

  void setMode(bool value) {
    if (mode == value) return;
    mode = value;
    notifyListeners();
  }
}