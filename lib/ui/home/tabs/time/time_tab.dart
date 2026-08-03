import 'package:flutter/material.dart';
import 'package:islami/core/resources/Color_Manager.dart';
import 'package:islami/ui/home/tabs/time/widget/azkar_card.dart';
import 'package:islami/ui/home/tabs/time/widget/header_card_time.dart';
import 'package:islami/ui/home/tabs/time/widget/next_pary_text.dart';
import 'package:islami/ui/home/tabs/time/widget/view_card_time.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widget/base_tob_body.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTabBody(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                decoration: BoxDecoration(
                  color: ColorsManager.gold,
                  borderRadius: BorderRadius.circular(40),
                ),
                // card time
                child: Column(
                  children: [
                    HeaderCardTime(),
                    const SizedBox(height: 20),
                    ViewCardTime(),
                    const SizedBox(height: 20),
                    NextPrayText(),
                  ],
                ),
              ),
              // Azkar
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Text(
                  "Azkar",
                  style: TextStylesHelper.smallLabelTextStyle(
                    textColor: Colors.white,
                  ),
                ),
              ),
              AzkarCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}