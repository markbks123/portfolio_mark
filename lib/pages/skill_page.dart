import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/models/card-item.dart';
import 'package:portfolio/models/header_item.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/themes/my_textstyle.dart';
import 'package:portfolio/widgets/card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/screen_helper.dart';

class Skills extends StatefulWidget {
  const Skills({
    super.key,
  });

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final skillController = PageController(viewportFraction: 0.8, keepPage: true);

  List<CardItem> pages = [
    CardItem(title: "Flutter", img: Assets.images.flutter),
    CardItem(title: "React", img: Assets.images.react),
    CardItem(title: "Html", img: Assets.images.html),
    // CardItem(title: "Node Js", img: Assets.images.nodeLogo.path),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: MyColors.grey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: ScreenHelper.isMobile(context) ? 100 : 16),
            Text(
              " My Skills",
              style: MyTextStyles.text30Bold.copyWith(color: MyColors.white),
            ),
            Container(
              width: ScreenHelper.isMobile(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width / 2,
              height: 240,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: skillController,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CardSkills(cardItem: pages[index]),
                    );
                  },
                ),
              ),
            ),
          ]),
    ));
  }
}
