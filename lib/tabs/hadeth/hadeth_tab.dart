import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_args.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethArgs> hadeth = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    if (hadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: settingsProvider.themeMode == ThemeMode.light
                          ? AppTheme.lightPrimary
                          : AppTheme.gold,
                      width: 3))),
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
             AppLocalizations.of(context)!.hadeth,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => IntrinsicHeight(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, HadethContentScreen.routeName,
                    arguments: HadethArgs(
                        hadethTitel: hadeth[index].hadethTitel,
                        hadethContent: hadeth[index].hadethContent)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    hadeth[index].hadethTitel,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            ),
            itemCount: hadeth.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
              color: settingsProvider.themeMode == ThemeMode.light
                  ? AppTheme.lightPrimary
                  : AppTheme.gold,
            ),
          ),
        )
      ],
    );
  }

  void loadHadethFile() async {
    String ahadethFile = await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> ahadethString = ahadethFile.split('#');
    hadeth = ahadethString.map(
      (hadethString) {
        List<String> hadethLines = hadethString.trim().split('\n');
        String hadethTitel = hadethLines.first;
        hadethLines.removeAt(0);
        List<String> hadethContent = hadethLines;
        return HadethArgs(
            hadethTitel: hadethTitel, hadethContent: hadethContent);
      },
    ).toList();
    setState(() {});
  }
}
