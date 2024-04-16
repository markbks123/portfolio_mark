import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/themes/my_textstyle.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      mobile: buildUi(ScreenHelper.mobileMaxWidth(context), context),
      tablet: buildUi(760.0, context),
      desktop: buildUi(1000, context),
    );
  }
}

Widget buildUi(double width, BuildContext context) => Container(
      color: Color.fromARGB(255, 56, 161, 187),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ResponsiveWrapper(
              maxWidth: width,
              minWidth: width,
              child: Column(
                children: [
                  Text("About Me",
                      style: MyTextStyles.text32Bold
                          .copyWith(color: MyColors.white)),
                  Flex(
                    direction: ScreenHelper.isMobile(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    children: [
                      Expanded(
                        flex: ScreenHelper.isMobile(context) ? 0 : 3,
                        child: Lottie.asset(Assets.images.me,
                            width: 500, repeat: false),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: ScreenHelper.isMobile(context) ? 0 : 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "I am 26 year old.Extremely motivated to constantly develop my skills and grow professionally ",
                                style: MyTextStyles.text18SemiBold
                                    .copyWith(color: MyColors.white)),
                            Text(
                                "I am confident in my ability to develop your organization and be ready to learn new things all the time",
                                style: MyTextStyles.text18SemiBold
                                    .copyWith(color: MyColors.white)),
                            const SizedBox(height: 5)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
