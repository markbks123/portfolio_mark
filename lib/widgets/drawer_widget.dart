import 'package:flutter/material.dart';
import 'package:portfolio/enum/header_items.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/themes/my_textstyle.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DrawerWidget extends StatelessWidget {
  final ItemScrollController itemController;
  const DrawerWidget({super.key, required this.itemController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.grey,
      child: SafeArea(
        child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  headerItems[index].title,
                  style:
                      MyTextStyles.text16Bold.copyWith(color: MyColors.black),
                ),
                onTap: () {
                  itemController.scrollTo(
                    index: headerItems[index].index,
                    duration: const Duration(seconds: 1),
                  );
                  Navigator.pop(context);
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12.0),
            itemCount: headerItems.length),
      ),
    );
  }
}
