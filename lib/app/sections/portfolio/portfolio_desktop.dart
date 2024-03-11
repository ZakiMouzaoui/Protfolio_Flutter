import 'package:flutter/material.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/app/widgets/gradient_text.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

import 'widgets/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomSectionHeading(text: "\nProjects"),
          Space.y(1.w)!,
          CustomSectionSubHeading(text: portfolioSubHeading),
          Space.y(2.w)!,
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 3.w,
            children: projectUtils
                .map(
                  (e) => ProjectCard(project: e),
                )
            .take(showAll ? projectUtils.length : 4)
                .toList(),
          ),
          Space.y(3.w)!,
          OutlinedButton(
            onPressed: (){
              setState(() {
                showAll = !showAll;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientText(showAll ? "See Less": "See More", gradient: pinkPurpleGradient,  style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),)
            ),
          )
        ],
      ),
    );
  }
}
