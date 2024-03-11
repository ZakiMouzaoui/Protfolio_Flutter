import 'package:flutter/material.dart';
import 'package:mysite/app/sections/contact/widgets/contact_form.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:sizer/sizer.dart';


class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10.h),
      child: Column(
        children: [
          CustomSectionHeading(text: contactHeading),
          Space.y(1.w)!,
          CustomSectionSubHeading(
            text:
                contactSubHeading,
          ),
          Space.y(2.w)!,
          const ContactForm()
          // Space.y!,
        ],
      ),
    );
  }
}
