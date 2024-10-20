import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/tabs/quran/quran_tab.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:islamic_app/widget/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = '/sura';

  const SuraContentScreen({super.key});

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  late SuraContentArgs args;

  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/${Provider.of<SettingsProvider>(context).backgroundImageName}.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
              title: Text(
            AppLocalizations.of(context)!.quran,
          )),
          body: Container(
              padding: const EdgeInsets.all(25),
              margin: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: MediaQuery.sizeOf(context).height * 0.07),
              decoration: BoxDecoration(
                  color: settingsProvider.themeMode == ThemeMode.light
                      ? AppTheme.white
                      : AppTheme.darkPrimary,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ' سورة ${args.suraName}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: settingsProvider.isDark
                                    ? AppTheme.gold
                                    : AppTheme.black),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 35),
                        child: Icon(
                          Icons.play_circle,
                          color: settingsProvider.themeMode == ThemeMode.light
                              ? AppTheme.black
                              : AppTheme.gold,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: settingsProvider.themeMode == ThemeMode.light
                        ? AppTheme.lightPrimary
                        : AppTheme.gold,
                    endIndent: 20,
                  ),
                  ayat.isEmpty
                      ? const LoadingIndicator()
                      : Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => Text(
                              ('${ayat[index]} ( ${index + 1} )'),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            itemCount: ayat.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                          ),
                        ),
                ],
              )),
        ));
  }

  void loadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}
