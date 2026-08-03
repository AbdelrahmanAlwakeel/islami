
import 'package:flutter/material.dart';
import 'package:islami/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami/ui/home/screen/Home_Screen.dart';
import 'package:islami/ui/onboarding/onboarding_screen.dart';
import 'package:islami/ui/sura_detalies/screen/sura_details_screen.dart';

import 'core/remote/local/prefs_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen(),
        OnBoardingScreen.routeName:(_)=>OnBoardingScreen()
      },
      initialRoute: OnBoardingScreen.routeName,
    );
  }
}