import 'package:flutter/material.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic_app/tabs/quran/quran_tab.dart';
import 'package:islamic_app/tabs/radio/radio_tab.dart';
import 'package:islamic_app/tabs/sebha/sebha_tab.dart';
import 'package:islamic_app/tabs/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget { 
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> { 
  int currentIndex = 0 ;
  List<Widget> tabs = [
    QuranTab() ,
    HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];
  @override
   Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/dafault_background.png'),
          fit: BoxFit.fill
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        body:tabs[currentIndex] ,
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: currentIndex,
          onTap:(index) {
            currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/quran_icon.png')),
              label:'Quran'
              ),
           BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/hadeth_icon.png')),
              label:'Hadeth'
              ),
           BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/sebha_icon.png')),
              label:'Sebha'
              ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/radio_icon.png')),
              label:'Radio'
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label:'Settings'
              ),
            
          ]
          ),
      ),
    );
  }
}
