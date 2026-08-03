import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/Color_Manager.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio/provider/radio_tab_provider.dart';
import 'package:islami/ui/home/tabs/radio/radio_tab.dart';
import 'package:provider/provider.dart';

import '../tabs/sebha/sebha_tab.dart';
import '../tabs/time/time_tab.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  int selectedIndex=0;
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    ChangeNotifierProvider(
      create: (context)=>RadioTabProvider(),
        child: const RadioTab()),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      bottomNavigationBar: NavigationBar(
          onDestinationSelected:(value) {
            setState(() {
              selectedIndex = value;
            });
          } ,
          selectedIndex: selectedIndex,
          backgroundColor: ColorsManager.gold,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: ColorsManager.black.withValues(
              alpha: 0.6
          ),
          labelTextStyle: WidgetStateTextStyle.resolveWith(
                (states) {
              return TextStyle(
                  color: ColorsManager.White,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
              );
            },
          ),
          destinations: [
            NavigationDestination(
                selectedIcon:SvgPicture.asset(AssetsManager.home_selected),
                icon: SvgPicture.asset(AssetsManager.home),
                label: StringsManager.homeTab
            ),
            NavigationDestination(
                selectedIcon:SvgPicture.asset(AssetsManager.hadeth_selected),
                icon: SvgPicture.asset(AssetsManager.hadeth),
                label: StringsManager.hadethTab
            ),
            NavigationDestination(
                selectedIcon:SvgPicture.asset(AssetsManager.sebha_selected),
                icon: SvgPicture.asset(AssetsManager.sebha),
                label: StringsManager.sebhaTab
            ),
            NavigationDestination(
                selectedIcon:SvgPicture.asset(AssetsManager.radio_selected),
                icon: SvgPicture.asset(AssetsManager.radio),
                label: StringsManager.radioTab
            ),
            NavigationDestination(
                selectedIcon:SvgPicture.asset(AssetsManager.time_selected),
                icon: SvgPicture.asset(AssetsManager.time),
                label: StringsManager.timeTab
            ),
          ]
      ),
      body: tabs[selectedIndex],
    );
  }
}
