import 'package:flutter/material.dart';
import 'package:portfolio/models/experience_item.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/themes/my_textstyle.dart';

import 'package:portfolio/utils/screen_helper.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  List<ExperienceItem> experience = [
    ExperienceItem(
      description:
          'ELECTRONICS AND COMPUTER SYSTEM ENGINEERING IN SILPAKORN UNIVERSITY',
      job: 'Student',
      period: '2016 - 2020',
    ),
    ExperienceItem(
      description: 'Castles Technology',
      job: 'Android Developer (java in EDC)',
      period: ' 2020  - 2021',
    ),
    ExperienceItem(
      description: 'TQD Co., Ltd.',
      job: 'Software Engineer (flutter)',
      period: '2021 - PRESENT',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
      tablet: _buildUi(760.0, context),
      desktop: _buildUi(1000, context),
    );
  }

  Widget _buildUi(double width, BuildContext context) => Container(
        color: Color.fromARGB(255, 56, 161, 187),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Experience',
                  style:
                      MyTextStyles.text30Bold.copyWith(color: MyColors.white),
                ),
                const SizedBox(height: 40),
                LayoutBuilder(builder: (context, constraints) {
                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: experience
                        .map((education) => SizedBox(
                              width: constraints.maxWidth / 2 - 20,
                              child: Container(
                                padding: EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: MyColors.grey,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(education.period,
                                        style: MyTextStyles.text18
                                            .copyWith(color: MyColors.black)),
                                    const SizedBox(height: 5),
                                    Text(education.description,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: MyTextStyles.text18
                                            .copyWith(color: MyColors.black)),
                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(education.job,
                                          style: MyTextStyles.text16Bold
                                              .copyWith(color: MyColors.green)),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  );
                })
              ],
            ),
          ),
        ),
      );
}
