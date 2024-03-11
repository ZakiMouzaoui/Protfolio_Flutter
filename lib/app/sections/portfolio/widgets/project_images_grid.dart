import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mysite/core/res/responsive.dart';


class ProjectImagesGrid extends StatefulWidget {
  const ProjectImagesGrid({super.key, required this.imagesFolder});

  final String? imagesFolder;

  @override
  State<ProjectImagesGrid> createState() => _ProjectImagesGridState();
}

class _ProjectImagesGridState extends State<ProjectImagesGrid> {
  List<String> imagePaths = [];


  Future _initImages() async {
    final manifestJson = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final images = json.decode(manifestJson).keys.where((String key) => key.startsWith('assets/imgs/${widget.imagesFolder}/')).toList();

    setState(() {
      imagePaths = images;
      });
  }

  @override
  void initState() {
    _initImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      scrollable: true,
      content: SizedBox(
        width: size.width*0.9,
        height: size.height*0.9,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: imagePaths.length,
          itemBuilder: (_,index){
            final img = imagePaths[index];
            return Image.asset(img, width: size.width*0.15, height: size.height*0.8, fit: BoxFit.cover,);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 1 : Responsive.isTablet(context) ? 3 : 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: size.height*0.8
          ),
        ),
      ),
    );
  }
}
