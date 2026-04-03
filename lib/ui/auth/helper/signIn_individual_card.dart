import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wespend/framework/controller/auth/login_controller.dart';
import 'package:wespend/framework/utils/extension/extension.dart';
import 'package:wespend/framework/utils/extension/screenutil_extension.dart';
import 'package:wespend/ui/routing/navigation_stack_item.dart';
import 'package:wespend/ui/utils/theme/app_colors.dart';
import 'package:wespend/ui/utils/theme/text_style.dart';
import 'package:wespend/ui/utils/widgets/common_button.dart';
import 'package:wespend/ui/utils/widgets/common_form_field.dart';
import 'package:wespend/ui/utils/widgets/common_text.dart';

import '../../../framework/provider/network/network.dart';

class SigninIndividualCard extends ConsumerStatefulWidget {
  const SigninIndividualCard({super.key});

  @override
  ConsumerState createState() => _SigninIndividualCardState();
}

class _SigninIndividualCardState extends ConsumerState<SigninIndividualCard> {
  @override
  Widget build(BuildContext context) {
    final loginWatch = ref.watch(loginController);
    return Container(
      width: 300.w,
      height: 450.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1.w,
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(title: "Welcome Back",style: TextStyles.bold.copyWith(fontSize: 22.sp)),
            CommonText(title: "Sign in to your personal dashboard",style: TextStyles.regular.copyWith(fontSize: 12.sp,color: AppColors.black838383)),

            SizedBox(height: 15.h,),
            Column(
              children: [
                CommonInputFormField(
                    textEditingController: loginWatch.usernameController
                ),
                SizedBox(height: 10.h,),
                CommonInputFormField(
                    textEditingController: loginWatch.passwordController
                ),
              ],
            ),

            SizedBox(height: 10.h,),

            CommonText(title: "Forgot Password",style: TextStyles.regular.copyWith(color: AppColors.secondary,fontSize: 14.sp),),

            ///sign  in
            SizedBox(height: 10.h,),
            CommonButton(buttonText: 'Sign In',height: 40.h),

            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white.withOpacity(0.2), // soft white (matches dark theme)
                    thickness: 1,
                  ),
                ),

                SizedBox(width: 10.w),

                CommonText(
                  title: "or continue with",
                  style: TextStyles.regular.copyWith(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Divider(
                    color: Colors.white.withOpacity(0.2),
                    thickness: 1,
                  ),
                ),
              ],
            ).paddingSymmetric(vertical: 20.h),

            ///google and apple sign in
            Row(
              children: [
                Expanded(child: CommonButton(
                  height: 30.h,
                  buttonText: 'Google',
                  backgroundColor: Colors.white.withOpacity(0.05),
                  borderColor: Colors.white.withOpacity(0.12),
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(14.r),
                  isGradient: false,
                )),
                SizedBox(width: 10.h,),
                Expanded(child: CommonButton(
                  height: 30.h,
                  buttonText: 'Apple',
                  isGradient: false,
                  backgroundColor: Colors.white.withOpacity(0.05),
                  borderColor: Colors.white.withOpacity(0.12),
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(14.r),
                )),
              ],
            ),

            ///create account
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(title: "Don't have an account? ",style: TextStyles.regular.copyWith(fontSize: 14.sp)),
                CommonText(title: "Create one free",style: TextStyles.regular.copyWith(color: AppColors.secondary,fontSize: 14.sp),),
              ],
            ),
          ]
      ).paddingSymmetric(vertical: 20.h,horizontal: 15.w),
    );
  }
}


