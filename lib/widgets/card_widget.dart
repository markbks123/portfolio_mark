import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/models/card-item.dart';
import 'package:portfolio/models/header_item.dart';
import 'package:portfolio/themes/my_colors.dart';
import 'package:portfolio/themes/my_textstyle.dart';

class CardSkills extends StatelessWidget {
  final CardItem cardItem;
  const CardSkills({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 90, child: Lottie.asset(cardItem.img, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Expanded(
                flex: 10,
                child: Text(
                  cardItem.title,
                  style: MyTextStyles.text18SemiBold
                      .copyWith(color: MyColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
