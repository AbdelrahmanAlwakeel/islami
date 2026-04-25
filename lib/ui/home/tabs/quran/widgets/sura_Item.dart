import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/Color_Manager.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/model/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraModel sura;
  SuraItem(this.sura);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AssetsManager.quranFrame),
            Text(sura.suraNumber.toString(),style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: ColorsManager.White
            ),)
          ],
        ),
        SizedBox(width: 24,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sura.suraNameEn,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorsManager.White
              ),),
              Text("${sura.versesNumber} Verses",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.White
              ),),
            ],
          ),
        ),
        Text(sura.suraNameAr,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.White
        ),),
      ],
    );
  }
}
