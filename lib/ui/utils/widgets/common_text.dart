import 'package:wespend/framework/utils/extension/screenutil_extension.dart';
import 'package:wespend/ui/utils/theme/theme.dart';

class CommonText extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final Color? clrFont;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final TextStyle? style;
  final TextOverflow? overflow;

  const CommonText({Key? key, this.title = '', this.fontWeight, this.fontStyle, this.fontSize, this.clrFont, this.maxLines, this.textAlign, this.textDecoration, this.style, this.overflow})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      //-- will not change if system fonts size changed
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.ellipsis,
      style:
          style ??
          TextStyle(
            fontFamily: TextStyles.fontFamily,
            fontWeight: fontWeight ?? TextStyles.fwRegular,
            fontSize: (fontSize ?? 14).sp,
            color: clrFont ?? Colors.white,
            fontStyle: fontStyle ?? FontStyle.normal,
            decorationColor: clrFont ?? Colors.black,
            decoration: textDecoration ?? TextDecoration.none,
          ),
    );
  }
}
