import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/home_screen.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islamic_app/tabs/quran/sura_content_screen.dart';

void main(){
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(context) => const HomeScreen(),
        SuraContentScreen.routeName : (context) => const SuraContentScreen(),
        HadethContentScreen.routeName : (context) => const HadethContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
    );
  }
}