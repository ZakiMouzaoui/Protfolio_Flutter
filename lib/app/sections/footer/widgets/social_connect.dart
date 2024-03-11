import 'package:flutter/material.dart';
import 'package:mysite/app/sections/footer/widgets/social_connect_desktop.dart';
import 'package:mysite/app/sections/footer/widgets/social_connect_mobile.dart';
import 'package:mysite/core/res/responsive.dart';


class SocialConnect extends StatelessWidget {
  const SocialConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: SocialConnectMobileTab(), tablet: SocialConnectMobileTab(), desktop: SocialConnectDesktop());
  }
}
