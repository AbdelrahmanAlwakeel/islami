import 'package:flutter/material.dart';

import '../../../../core/resources/Color_Manager.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../model/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadeth_details";
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("${StringsManager.hadith} ${hadethModel.hadethNumber}"),
        titleTextStyle: TextStyle(
            color: ColorsManager.gold,
            fontSize: 20,
            fontWeight: FontWeight.w700
        ),
        iconTheme: IconThemeData(
            color: ColorsManager.gold
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Row(
                  children: [
                    Image.asset(AssetsManager.left_corner,color: ColorsManager.gold,),
                    Expanded(
                      child: Text(hadethModel.title,
                        textAlign: TextAlign.center,
                        style:TextStyle(
                            color: ColorsManager.gold,
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                        ) ,),
                    ),
                    Image.asset(AssetsManager.right_corner,color: ColorsManager.gold),
                  ],
                ),
                SizedBox(height: 17,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(hadethModel.content,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          height: 2,
                          color: ColorsManager.gold,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),),
                  ),
                ),
              ],),
            ),
          ),
          Image.asset(AssetsManager.mosqueHadethDetails)
        ],
      ),
    );
  }
}