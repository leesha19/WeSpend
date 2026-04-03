import 'package:wespend/ui/utils/theme/theme.dart';

class ThemeStyle {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: TextStyles.fontFamily,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.scaffoldBGByTheme(),
      hoverColor: Colors.transparent,
      hintColor: AppColors.grey8D8C8C,
      primarySwatch: AppColors.colorPrimary,
      textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColors.textByTheme()),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(elevation: 0.0, backgroundColor: AppColors.scaffoldBGByTheme()),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.colorPrimary,
      ).copyWith(surface: AppColors.scaffoldBGByTheme()),
    );
  }
}
