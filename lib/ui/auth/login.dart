import 'package:flutter/material.dart';
import 'package:wespend/ui/utils/theme/app_colors.dart';
import 'package:wespend/ui/utils/widgets/common_button.dart';
import 'package:wespend/ui/utils/widgets/common_text.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF7B5CF0),
                    Color(0xFF9D7BF8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
              ),
            ),
            ),
            CommonText(title: "WeSpend",),
            CommonButton(
              buttonText: "Login",
              onTap: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
