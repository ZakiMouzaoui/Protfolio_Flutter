import 'package:flutter/material.dart';
import 'package:mysite/app/sections/portfolio/widgets/project_images_grid.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => openURL(widget.project.link),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
        } else {
          setState(() => isHover = false);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        width: Responsive.isDesktop(context) ? 30.w : 70.w,
        height: 40.h,
        decoration: BoxDecoration(
          gradient: isHover ? pinkPurpleGradient : grayBack,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [

            AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: isHover ? 0.1 : 1.0,
              child: Container(
                width: Responsive.isDesktop(context) ? 30.w : 70.w,
                //height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(widget.project.banner),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            if(isHover)Padding(
              padding: isHover ? const EdgeInsets.all(20) : EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.project.icons.map((e) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Image.asset(
                        e,
                        height: height * 0.05,
                      ),
                    ),).toList()
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    widget.project.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isHover ? whiteColor : theme.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    widget.project.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isHover ? whiteColor : theme.textColor,
                    ),
                    maxLines: Responsive.isDesktop(context) ? 5 : 3,
                    overflow: TextOverflow.fade,
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: ()=>openURL(widget.project.link), icon: const Icon(Icons.code)),

                      if(widget.project.imagesFolder != null)IconButton(onPressed: (){
                        showAdaptiveDialog(context: context, builder: (_)=>ProjectImagesGrid(imagesFolder: widget.project.imagesFolder,));
                      }, icon: const Icon(Icons.remove_red_eye)),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
