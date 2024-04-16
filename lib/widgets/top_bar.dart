import 'package:flutter/material.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/themes/my_textstyle.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents(
      {super.key, required this.opacity, required this.itemScrollController});

  final double opacity;
  final ItemScrollController itemScrollController;

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final desktopheader = PreferredSize(
        child: DesktopTabBar(
          widget: widget,
          screenSize: screenSize,
          itemsScrollController: widget.itemScrollController,
        ),
        preferredSize: Size(screenSize.width, 70));

    return ScreenHelper(
      desktop: desktopheader,
      tablet: desktopheader,
      mobile: buildMobileHeader(),
    );
  }
}

class DesktopTabBar extends StatelessWidget {
  final Size screenSize;
  final TopBarContents widget;
  final ItemScrollController? itemsScrollController;
  const DesktopTabBar(
      {super.key,
      required this.screenSize,
      required this.widget,
      this.itemsScrollController});
  InkWell menuItem({required int toPage, required String title}) {
    return InkWell(
      onTap: () => itemsScrollController?.scrollTo(
        index: toPage,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      ),
      child: Text(
        title,
        style: MyTextStyles.text16Bold.copyWith(color: MyColors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 24),
            menuItem(toPage: 0, title: 'Home'),
            const SizedBox(width: 24),
            menuItem(toPage: 1, title: 'About'),
            const SizedBox(width: 24),
            menuItem(toPage: 2, title: 'My Projects'),
            const SizedBox(width: 24),
            menuItem(toPage: 3, title: 'Experience'),
            const SizedBox(width: 24),
            menuItem(toPage: 4, title: 'My Skills'),
            const SizedBox(width: 24),
            menuItem(toPage: 5, title: 'Contact Me')
          ],
        ),
      ),
    );
  }
}

Widget buildMobileHeader() => SafeArea(
        child: Container(
      color: MyColors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            GestureDetector(
              onTap: () => Globals.scaffoldKey.currentState!.openEndDrawer(),
              child: const Icon(
                Icons.menu,
                color: MyColors.black,
                size: 28,
              ),
            )
          ],
        ),
      ),
    ));

class HeaderLogo extends StatelessWidget {
  HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Globals.scaffoldKey.currentState!.openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 10),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Mark",
                    style: MyTextStyles.text32Bold
                        .copyWith(color: MyColors.black)),
              ],
            ),
          ),
        ),
      );
}
