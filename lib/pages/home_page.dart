import 'package:flutter/material.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/experience_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/pages/skill_page.dart';
import 'package:portfolio/pages/welcome_page.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/widgets/drawer_widget.dart';
import 'package:portfolio/widgets/top_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages = [
    const WelcomePage(),
    const AboutMe(),
    const ProjectsPage(),
    const ExperiencePage(),
    const Skills(),
    ContactPage(),
  ];

  final pageController = PageController(initialPage: 0);
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size(100, 100),
        child: TopBarContents(
          opacity: 0.0,
          itemScrollController: itemScrollController,
        ),
      ),
      endDrawer: DrawerWidget(itemController: itemScrollController),
      body: Container(
        decoration: const BoxDecoration(color: MyColors.grey),
        child: ScrollablePositionedList.builder(
          initialScrollIndex: 0,
          shrinkWrap: true,
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemScrollController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];

            return page;
          },
        ),
      ),
    );
  }
}
