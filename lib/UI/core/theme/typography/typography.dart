import 'package:flutter/material.dart';
import 'package:hows_the_weather/UI/core/theme/typography/typography_text_styles.dart';

class WeatherAppTypo extends ThemeExtension<WeatherAppTypo> {
  WeatherAppTypo({
    this.display2xl = AppTextStyles.display2xl,
    this.displayXl = AppTextStyles.displayXl,
    this.displayLg = AppTextStyles.displayLg,
    this.displayMd = AppTextStyles.displayMd,
    this.displaySm = AppTextStyles.displaySm,
    this.displayXsm = AppTextStyles.displayXsm,
    this.display2xsm = AppTextStyles.display2xsm,
    this.displayButton = AppTextStyles.displayButton,
  });

  final TextStyle? display2xl;
  final TextStyle? displayXl;
  final TextStyle? displayLg;
  final TextStyle? displayMd;
  final TextStyle? displaySm;
  final TextStyle? displayXsm;
  final TextStyle? display2xsm;
  final TextStyle? displayButton;

  @override
  ThemeExtension<WeatherAppTypo> copyWith({
    TextStyle? display2XL,
    TextStyle? displayXL,
    TextStyle? displayLG,
    TextStyle? displayMD,
    TextStyle? displaySM,
    TextStyle? displayXSM,
    TextStyle? display2XSM,
    TextStyle? displayButton,
  }) {
    return WeatherAppTypo(
      display2xl: display2XL ?? display2xl,
      displayXl: displayXL ?? displayXl,
      displayLg: displayLG ?? displayLg,
      displayMd: displayMD ?? displayMd,
      displaySm: displaySM ?? displaySm,
      displayXsm: displayXSM ?? displayXsm,
      display2xsm: display2XSM ?? display2xsm,
      displayButton: displayButton ?? displayButton,
    );
  }

  @override
  ThemeExtension<WeatherAppTypo> lerp(
    covariant ThemeExtension<WeatherAppTypo>? other,
    double t,
  ) {
    if (other is! WeatherAppTypo) {
      return this;
    }

    return WeatherAppTypo(
      display2xl: TextStyle.lerp(display2xl, other.display2xl, t),
      displayXl: TextStyle.lerp(displayXl, other.displayXl, t),
      displayLg: TextStyle.lerp(displayLg, other.displayLg, t),
      displayMd: TextStyle.lerp(displayMd, other.displayMd, t),
      displaySm: TextStyle.lerp(displaySm, other.displaySm, t),
      displayXsm: TextStyle.lerp(displayXsm, other.displayXsm, t),
      display2xsm: TextStyle.lerp(display2xsm, other.display2xsm, t),
      displayButton: TextStyle.lerp(displayButton, other.displayButton, t),
    );
  }

  static WeatherAppTypo? of(BuildContext context) {
    return Theme.of(context).extension<WeatherAppTypo>();
  }
}
