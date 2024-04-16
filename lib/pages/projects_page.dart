import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/models/project_item.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/themes/my_textstyle.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:portfolio/utils/utils.dart';

import 'package:responsive_framework/responsive_wrapper.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = [
      Project(
        description: 'Chat_App',
        image: Assets.images.chat.path,
        gitLink: 'https://github.com/markbks123',
      ),
    ];
    return ScreenHelper(
      desktop: _buildUi(1000.0, context, projects),
      tablet: _buildUi(760.0, context, projects),
      mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context, projects),
    );
  }

  Widget _buildUi(double width, BuildContext context, List<Project> projects) =>
      ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Project',
                style: MyTextStyles.text30Bold.copyWith(color: MyColors.black),
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 40),
              LayoutBuilder(builder: (context, constraints) {
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: projects
                      .map(
                        (project) => SizedBox(
                          width: constraints.maxWidth / 2.0 - 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(project.image),
                              const SizedBox(height: 5),
                              Text(project.description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: MyTextStyles.text16
                                      .copyWith(color: MyColors.black)),
                              IconButton(
                                onPressed: () =>
                                    Utils.launchURL(project.gitLink),
                                icon: const FaIcon(FontAwesomeIcons.github),
                                color: MyColors.black,
                                iconSize: 24,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                );
              })
            ],
          ),
        ),
      );
}
