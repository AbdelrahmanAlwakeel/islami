import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/resources/Color_Manager.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../model/sura_model.dart';
import '../../../../sura_detalies/screen/sura_details_screen.dart';

class SuraItem extends StatelessWidget {
  SuraModel sura;
  void Function() onClick;
  SuraItem(this.sura,this.onClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,arguments: sura);
      },
      child: Row(
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
      ),
    );
  }
}