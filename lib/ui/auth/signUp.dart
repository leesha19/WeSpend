import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wespend/framework/controller/auth/login_controller.dart';
import 'package:wespend/framework/utils/extension/extension.dart';
import 'package:wespend/framework/utils/extension/screenutil_extension.dart';
import 'package:wespend/ui/auth/helper/signIn_couple_card.dart';
import 'package:wespend/ui/auth/helper/signIn_individual_card.dart';
import 'package:wespend/ui/utils/theme/app_colors.dart';
import 'package:wespend/ui/utils/theme/assets.gen.dart';
import 'package:wespend/ui/utils/theme/text_style.dart';
import 'package:wespend/ui/utils/widgets/common_button.dart';
import 'package:wespend/ui/utils/widgets/common_svg.dart';
import 'package:wespend/ui/utils/widgets/common_text.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    final loginWatch = ref.watch(loginController);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonSVG(strIcon:  Assets.svgs.svgMoney.path,width: 50,),
            CommonText(title: "WeSpend",style: TextStyles.bold.copyWith(fontSize: 26.sp)),
            CommonText(title: "Smart Expense Tracking App",style: TextStyles.regular.copyWith(fontSize: 12.sp,color: AppColors.black838383)),

            ///mode switch
            SizedBox(height: 20.w),
            Container(
              width: 300.w,
              height: 50.h,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.05),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  ///individual
                  Expanded(
                    child: CommonButton(
                      buttonText: "Individual",
                      isGradient: loginWatch.mode == true ,
                      backgroundColor: loginWatch.mode == true
                          ? null
                          : Colors.transparent,
                      buttonTextColor: loginWatch.mode == true
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50.r),
                      onTap: () {
                        loginWatch.setMode(true);
                      },
                    ),
                  ),
                  SizedBox(width: 4.w),
                  ///duo mode
                  Expanded(
                    child: CommonButton(
                      buttonText: "Couple",
                      isGradient: loginWatch.mode == false ,
                      backgroundColor: loginWatch.mode == false
                          ? null
                          : Colors.transparent,
                      buttonTextColor: loginWatch.mode == false
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50.r),
                      onTap: () {
                        loginWatch.setMode(false);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20.w),

            ///sign-in and sign-up card
            SizedBox(height: 20.w),

            SignUpForm()
          ],
        ),
      ),
    );
  }
}
