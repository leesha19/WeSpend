import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wespend/framework/utils/extension/screenutil_extension.dart';
import 'package:wespend/ui/utils/theme/app_colors.dart';
import 'package:wespend/ui/utils/theme/text_style.dart';
import 'package:wespend/ui/utils/widgets/common_form_field.dart';
import 'package:wespend/ui/utils/widgets/common_text.dart';

import '../../../framework/controller/auth/signUp_controller.dart';
import '../../../framework/provider/network/network.dart';

class SignupStep3 extends ConsumerStatefulWidget {
  const SignupStep3({super.key});

  @override
  ConsumerState createState() => _SignupStep3State();
}

class _SignupStep3State extends ConsumerState<SignupStep3> {
  @override
  Widget build(BuildContext context) {
    final signUpWatch = ref.watch(signUpController);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Invite Code Card
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.cardColor,
          ),
          child: Column(
            children: [
              CommonText(
                title: "PARTNER'S INVITE CODE",
                style: TextStyles.regular,
              ),
              SizedBox(height: 10.h),
              CommonText(
                title: "482193", // dynamic later
                style: TextStyles.bold.copyWith(fontSize: 28.sp),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        /// Partner info card
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.cardColor,
          ),
          child: Row(
            children: [
              CircleAvatar(radius: 20.r),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(title: "Rohan Sharma"),
                  CommonText(
                    title: "rohan@email.com",
                    style: TextStyles.regular,
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.orange.withOpacity(0.2),
                ),
                child: CommonText(
                  title: "Pending",
                  style: TextStyles.regular.copyWith(
                    color: Colors.orange,
                  ),
                ),
              )
            ],
          ),
        ),

        SizedBox(height: 16.h),

        /// Info card
        Container(
            padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(title: "Share the code if needed"),
              SizedBox(height: 6.h),
              CommonText(
                title:
                "You can also share the 6-digit code directly. Couple features unlock once they join.",
                style: TextStyles.regular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
