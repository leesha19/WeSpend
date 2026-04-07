import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wespend/framework/dependency_injection/inject.dart';

import '../../provider/network/network.dart';

final signUpController = ChangeNotifierProvider((ref) => getIt<SignUpController>());

@injectable
class SignUpController extends ChangeNotifier {

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final partnerEmailController = TextEditingController();
  final passwordController = TextEditingController();

  final signUpKey = GlobalKey();

   int step = 1;

  void stepper(){
   step =  step + 1;
    notifyListeners();
  }

   bool? mode = true;
  void setMode(bool value) {
    if (mode == value) return;
    mode = value;
    notifyListeners();
  }


}