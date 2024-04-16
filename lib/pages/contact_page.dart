import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/models/contact_item.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  List<ContactItem> footerItems = [
    ContactItem(
        iconPath: Assets.images.linkedin.path,
        title: 'Inkedin',
        link: "https://th.linkedin.com/in/tharin-phuphulphian-9823a41a6"),
    ContactItem(
        iconPath: Assets.images.email.path,
        title: 'Tharin09591171@gmail.com',
        link: ""),
  ];

  @override
  Widget build(BuildContext context) => ScreenHelper(
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUi(760.0, context),
        desktop: _buildUi(1000, context),
      );

  Widget _buildUi(double width, BuildContext context) => Container(
        color: Color.fromARGB(255, 56, 161, 187),
        child: Center(
          child: ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: footerItems
                            .map(
                              (footerItem) => SizedBox(
                                height: 120,
                                width: ScreenHelper.isMobile(context)
                                    ? constraints.maxWidth / 2 - 20
                                    : constraints.maxWidth / 4 - 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Utils.launchURL(footerItem.link);
                                          },
                                          child: Image.asset(
                                              footerItem.iconPath,
                                              width: 50),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          child: Text(
                                            footerItem.title,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Flex(
                      direction: ScreenHelper.isMobile(context)
                          ? Axis.vertical
                          : Axis.horizontal,
                      mainAxisAlignment: ScreenHelper.isMobile(context)
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Copyright (c) 2024 Tharin Phuphunpien. All right Reserved',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  'Privacy Policy',
                                  // style: TextStyle(color: captionColor),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: const Text(
                                '|',
                                // style: TextStyle(color: captionColor),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  'Terms & Condition',
                                  // style: TextStyle(color: captionColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16)
                  ],
                );
              },
            ),
          ),
        ),
      );
}
