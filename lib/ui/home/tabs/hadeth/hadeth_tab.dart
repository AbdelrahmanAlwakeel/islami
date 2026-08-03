import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth/widget/hadeth_item.dart';


import '../../../../core/resources/assets_manager.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  PageController pageController = PageController(
    viewportFraction: 0.8,
  );

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManager.hadethBack),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,)
      ),
      child: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(AssetsManager.islamiHeader,width: screenWidth*0.75,)),
            SizedBox(height: 55,),
            Expanded(
              child: PageView.builder(
                controller:pageController ,
                itemBuilder: (context, index) =>HadethItem(
                  index: index,
                  isSelected:index==selectedIndex ,) ,
                onPageChanged: (newPageIndex) {
                  print("selected index $newPageIndex");
                  setState(() {
                    selectedIndex = newPageIndex;
                  });
                },
                itemCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}