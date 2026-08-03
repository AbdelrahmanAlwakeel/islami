import 'package:flutter/material.dart';
import 'package:islami/core/resources/Color_Manager.dart';


import '../../../../../core/theme/text_styles.dart';

class HeaderCardTime extends StatelessWidget {
  const HeaderCardTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "4 Aug,\n2026",
            style: TextStylesHelper.largeBoldTextStyle(
              textColor: ColorsManager.White,
            ),
          ),
          Column(
            children: [
              Text(
                'Pray Time',
                style: TextStylesHelper.largeLabelBoldTextStyle(
                  textColor: ColorsManager.gray,
                ),
              ),
              Text(
                "Tuesday",
                style: TextStylesHelper.largeLabelBoldTextStyle(
                  textColor: ColorsManager.black,
                ),
              ),
            ],
          ),
          Text(
            "09 Muh,\n1448",
            style: TextStylesHelper.largeBoldTextStyle(
              textColor: ColorsManager.White,
            ),
          ),
        ],
      ),
    );
  }
}