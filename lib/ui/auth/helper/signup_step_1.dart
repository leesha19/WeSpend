import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wespend/framework/utils/extension/screenutil_extension.dart';
import 'package:wespend/ui/utils/widgets/common_form_field.dart';

import '../../../framework/controller/auth/signUp_controller.dart';
import '../../../framework/provider/network/network.dart';

class SignupStep1 extends ConsumerStatefulWidget {
  const SignupStep1({super.key});

  @override
  ConsumerState createState() => _SignupStep1State();
}

class _SignupStep1State extends ConsumerState<SignupStep1> {
  @override
  Widget build(BuildContext context) {
    final signUpWatch = ref.watch(signUpController);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CommonInputFormField(
                textEditingController: signUpWatch.firstnameController,
                hintText: "First Name",
              ),
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: CommonInputFormField(
                textEditingController: signUpWatch.lastnameController,
                hintText: "Last Name",
              ),
            ),
          ],
        ),

        SizedBox(height: 10.h,),
        CommonInputFormField(
          textEditingController: signUpWatch.emailController,
          hintText: "Your Email",
        ),

        SizedBox(height: 10.h,),
        CommonInputFormField(
          textEditingController: signUpWatch.passwordController,
          hintText: "Min 8 Characters",
        ),

      ],
    );
  }
}
