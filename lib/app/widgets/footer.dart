import 'package:flutter/material.dart';
import 'package:mysite/app/sections/contact/contact_desktop.dart';
import 'package:mysite/app/sections/contact/contact_mobile.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../../changes/strings.dart';
import '../../core/color/colors.dart';
import '../utils/contact_utils.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Responsive(mobile: ContactMobileTab(), tablet: ContactMobileTab(), desktop: ContactDesktop()),
        Container(
          margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
          height: height * 0.07,
          width: width,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Developed by "),
                InkWell(
                  onTap: () => openURL(gitHub),
                  child: const Text(
                    " Zaki Mouzaoui ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(" © ${DateTime.now().year}"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
