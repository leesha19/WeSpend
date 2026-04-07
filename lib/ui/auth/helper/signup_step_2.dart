import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wespend/framework/utils/extension/screenutil_extension.dart';
import 'package:wespend/ui/utils/theme/app_colors.dart';
import 'package:wespend/ui/utils/theme/text_style.dart';
import 'package:wespend/ui/utils/widgets/common_form_field.dart';
import 'package:wespend/ui/utils/widgets/common_text.dart';

import '../../../framework/controller/auth/signUp_controller.dart';
import '../../../framework/provider/network/network.dart';

class SignupStep2 extends ConsumerStatefulWidget {
  const SignupStep2({super.key});

  @override
  ConsumerState createState() => _SignupStep2State();
}

class _SignupStep2State extends ConsumerState<SignupStep2> {
  @override
  Widget build(BuildContext context) {
    final signUpWatch = ref.watch(signUpController);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// How it works card
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                title: "How it works",
                style: TextStyles.medium,
              ),
              SizedBox(height: 8.h),
              CommonText(
                title:
                "Enter your partner's email. We send them a 6-digit code. They use it to join your shared account.",
                style: TextStyles.regular,
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        /// Partner email field
        CommonText(
          title: "PARTNER'S EMAIL",
          style: TextStyles.regular,
        ),

        SizedBox(height: 8.h),


        CommonInputFormField(
          hintText: "partner@email.com",
          textEditingController: signUpWatch.partnerEmailController,
        ),

        SizedBox(height: 20.h),

        /// Skip option
        Center(
          child: CommonText(
            title: "Skip – invite partner later",
            style: TextStyles.regular.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
