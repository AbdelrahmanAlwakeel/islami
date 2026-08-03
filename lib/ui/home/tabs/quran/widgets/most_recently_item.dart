import 'package:flutter/material.dart';
import 'package:islami/ui/sura_detalies/screen/sura_details_screen.dart';

import '../../../../../core/resources/Color_Manager.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../model/sura_model.dart';

class MostRecentlyItem extends StatelessWidget {
  final SuraModel sura;

  const MostRecentlyItem({super.key,required this.sura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,arguments: sura);
      },
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(sura.suraNameEn,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.black
                ),),
                Text(sura.suraNameAr,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.black
                ),),
                Text("${sura.versesNumber} Verses",style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.black
                ),),
              ]),
          Image.asset(AssetsManager.mostRecent)
        ]),
      ),
    );
  }
}