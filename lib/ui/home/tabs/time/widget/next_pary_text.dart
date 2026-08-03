import 'package:flutter/material.dart';
import 'package:islami/core/resources/Color_Manager.dart';

import '../../../../../core/theme/text_styles.dart';

class NextPrayText extends StatefulWidget {
  const NextPrayText({super.key});

  @override
  State<NextPrayText> createState() => _NextPrayTextState();
}

class _NextPrayTextState extends State<NextPrayText> {
  bool isMuted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 30),
          Text(
            "Next Pray - 02:32",
            style: TextStylesHelper.largeTextStyle(
              textColor: ColorsManager.black,
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  isMuted = !isMuted;
                });
              },
              child: isMuted? Icon(Icons.volume_off_rounded, color: Colors.black,size: 30,)
                  : Icon(Icons.volume_up_rounded, color: Colors.black,size: 30,)
          ),
        ],
      ),
    );
  }
}