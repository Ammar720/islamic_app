import 'package:flutter/material.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic_app/tabs/quran/quran_tab.dart';
import 'package:islamic_app/tabs/radio/radio_tab.dart';
import 'package:islamic_app/tabs/sebha/sebha_tab.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:islamic_app/tabs/settings/settings_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/${Provider.of<SettingsProvider>(context).backgroundImageName}.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.islami),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items:  [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/quran_icon.png')),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/hadeth_icon.png')),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/sebha_icon.png')),
                  label:AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/radio_icon.png')),
                  label:AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings_outlined), label: AppLocalizations.of(context)!.settings),
            ]),
      ),
    );
  }
}
