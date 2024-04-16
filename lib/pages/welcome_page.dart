import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/themes/my_textstyle.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.amber,
    Colors.cyan,
    Colors.brown,
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      mobile: buildUi(ScreenHelper.mobileMaxWidth(context), context),
      tablet: buildUi(760.0, context),
      desktop: buildUi(1000, context),
    );
  }

  Widget buildUi(double width, BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ResponsiveWrapper(
                maxWidth: width,
                minWidth: width,
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            "Hi",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Tharin",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'I\'m',
                                  style: TextStyle(
                                    fontFamily: 'Horizon',
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                DefaultTextStyle(
                                  style: MyTextStyles.text32Bold
                                      .copyWith(color: MyColors.white),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      RotateAnimatedText('Passionate'),
                                      RotateAnimatedText('Hard Working'),
                                      RotateAnimatedText('Flutter Developer'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              "I am confident in my ability to develop your organization and be ready to learn new things all the time.",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          // const SizedBox(height: 30),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     side: const BorderSide(
                          //       width: 3,
                          //       color: Colors.white,
                          //     ),
                          //     backgroundColor: MyColors.white,
                          //     padding: const EdgeInsets.all(20),
                          //   ),
                          //   child: AnimatedTextKit(
                          //     animatedTexts: [
                          //       ColorizeAnimatedText(
                          //         'Download CV',
                          //         textStyle: const TextStyle(
                          //             fontSize: 30,
                          //             fontWeight: FontWeight.bold),
                          //         colors: colorizeColors,
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                        flex: ScreenHelper.isMobile(context) ? 0 : 30,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                              decoration: BoxDecoration(
                                color: MyColors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: MyColors.grey.withOpacity(0.5),
                                    spreadRadius: 10,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Lottie.asset(Assets.images.man,
                                  fit: BoxFit.cover)),
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
