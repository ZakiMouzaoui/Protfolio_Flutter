import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';

List<TyperAnimatedText> desktopList = [
  TyperAnimatedText(animationTxt1,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 32, color: const Color(0XFFaa367c))),
  TyperAnimatedText(animationTxt2,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 32, color: const Color(0XFFaa367c))),
  TyperAnimatedText(animationTxt3,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 32, color: const Color(0XFFaa367c))),
];

List<TyperAnimatedText> tabList = [
  TyperAnimatedText(animationTxt1,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 20)),
  TyperAnimatedText(animationTxt2,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 20)),
  TyperAnimatedText(animationTxt3,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 20)),
];
List<TyperAnimatedText> mobileList = [
  TyperAnimatedText(animationTxt1,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 16)),
  TyperAnimatedText(animationTxt2,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 16)),
  TyperAnimatedText(animationTxt3,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 16)),
];
