import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wespend/framework/controller/auth/login_controller.dart';
import 'package:wespend/framework/controller/auth/signUp_controller.dart';
import 'package:wespend/framework/utils/extension/extension.dart';
import 'package:wespend/framework/utils/extension/screenutil_extension.dart';
import 'package:wespend/ui/auth/helper/signup_step_1.dart';
import 'package:wespend/ui/auth/helper/signup_step_2.dart';
import 'package:wespend/ui/auth/helper/signup_step_3.dart';
import 'package:wespend/ui/routing/navigation_stack_item.dart';
import 'package:wespend/ui/utils/theme/app_colors.dart';
import 'package:wespend/ui/utils/theme/text_style.dart';
import 'package:wespend/ui/utils/widgets/common_button.dart';
import 'package:wespend/ui/utils/widgets/common_form_field.dart';
import 'package:wespend/ui/utils/widgets/common_text.dart';

import '../../../framework/provider/network/network.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    final signUpWatch = ref.watch(signUpController);
    return Form(
      key: signUpWatch.signUpKey ,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            signUpWatch.step == 1 ?
            SignupStep1() : signUpWatch.step == 2 ?
              SignupStep2()  : SignupStep3()
            ,

            ///sign  in
            SizedBox(height: 20.h,),
            CommonButton(
              onTap: (){
                signUpWatch.stepper();
              },
                buttonText: signUpWatch.step == 1 ? 'Continue' : signUpWatch.step == 2  ?'Send Invite Code' : 'Go to my dashboard',
                height: 40.h
            ),


            ///create account
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(title: "Have an account ? ",style: TextStyles.regular.copyWith(fontSize: 14.sp)),
                CommonText(title: "Sign in",style: TextStyles.regular.copyWith(color: AppColors.secondary,fontSize: 14.sp),),
              ],
            ),
          ]
      ).paddingSymmetric(vertical: 20.h,horizontal: 15.w),
    );
  }
}


