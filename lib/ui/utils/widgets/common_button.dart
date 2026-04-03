import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wespend/framework/utils/extension/context_extension.dart';
import 'package:wespend/framework/utils/extension/extension.dart';
import 'package:wespend/framework/utils/extension/screenutil_extension.dart';
import 'package:wespend/ui/utils/theme/theme.dart';
import 'package:wespend/ui/utils/widgets/common_svg.dart';
import 'dart:async';
import 'package:wespend/ui/utils/widgets/common_text.dart';

/// Global Variable
bool isButtonClicked = false;

class CommonButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final String? leftImage;
  final double? leftImageHeight;
  final double? leftImageWidth;
  final double? leftImageHorizontalPadding;
  final Color? leftImageColor;
  final String? rightImage;
  final double? rightImageHeight;
  final double? rightImageWidth;
  final double? rightImageHorizontalPadding;
  final double? fontSize;
  final String? buttonText;
  final int? buttonMaxLine;
  final TextStyle? buttonTextStyle;
  final double? buttonHorizontalPadding;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onValidateTap;
  final TextAlign? buttonTextAlignment;
  final Color? buttonTextColor;
  final bool? isGradient;
  final bool? isPrefixEnable;
  final bool? isLoading;
  final bool isShowLoader;
  final Color? loadingAnimationColor;
  final double? loaderSize;

  const CommonButton({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.leftImage,
    this.leftImageHeight,
    this.leftImageWidth,
    this.leftImageHorizontalPadding,
    this.leftImageColor,
    this.rightImage,
    this.rightImageHeight,
    this.rightImageWidth,
    this.rightImageHorizontalPadding,
    this.buttonText,
    this.buttonMaxLine,
    this.buttonTextStyle,
    this.buttonHorizontalPadding,
    this.onTap,
    this.onValidateTap,
    this.buttonTextAlignment,
    this.buttonTextColor,
    this.isGradient = true,
    this.isPrefixEnable,
    this.fontSize,
    this.isLoading,
    this.isShowLoader=true,
    this.loadingAnimationColor,
    this.loaderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if(!isButtonClicked) {
          if (!(isLoading ?? false)) {
            onTap?.call();
          }
          else if (!(isLoading ?? false)) {
          onValidateTap?.call();
        }
          isButtonClicked = true;
          Future.delayed(Duration(seconds:2),() {
            isButtonClicked = false;
          });
        }
      },
      child: AbsorbPointer(
        absorbing: isLoading ?? false,
        child: Container(
          height: height?.h ,
          width: width?.w ?? double.infinity,
          decoration: BoxDecoration(
            gradient: isGradient == true ? const LinearGradient(
              colors: [
                Color(0xFF7B5CF0),
                Color(0xFF9D7BF8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ) : null,
            boxShadow: isGradient == true
                ? [
              BoxShadow(
                color: const Color(0xFF7B5CF0).withOpacity(0.5),
                blurRadius: 10.r,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ]
                : [],
            color: isGradient == true ? null : (backgroundColor ?? AppColors.primary),
            borderRadius: borderRadius ?? BorderRadius.circular(9),
            border: Border.all(
              color: borderColor ?? AppColors.transparent,
              width: borderWidth ?? 0,
            ),
          ),
          child: isShowLoader && (isLoading ?? false)
              ? Center(
            child: LoadingAnimationWidget.waveDots(
              color: loadingAnimationColor ?? Colors.white,
              size: loaderSize ?? 30,
            ),
          )
              :  Padding(
            padding: EdgeInsets.symmetric(horizontal: buttonHorizontalPadding ?? 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(leftImage != null)
                  CommonSVG( strIcon: leftImage??'',height: leftImageHeight,width: leftImageWidth, colorFilter: leftImageColor != null ? ColorFilter.mode(leftImageColor!, BlendMode.srcIn) : null,).paddingOnly(right: 5),
              Flexible(
                child: CommonText(
                  title: buttonText ?? '',
                  style: buttonTextStyle ?? TextStyles.medium.copyWith(fontSize: fontSize ?? 14, color: buttonTextColor ?? Colors.white),
                  maxLines: buttonMaxLine ?? 1,
                  textAlign: buttonTextAlignment ?? TextAlign.center,
                ),
              ),
              ],
            ),
          ).alignAtCenter(),
        ),
      ),
    );
  }
}

/*
Widget Usage
CommonButton(
          buttonText: "Login",
          onTap: () {

          },
        )
* */

/*
*
* safeOnTap is only required for buttons to avoid repetitive calls.
* no need to wrap whole scaffold into safeOnTap, Use GestureDetector for that.
*
* */