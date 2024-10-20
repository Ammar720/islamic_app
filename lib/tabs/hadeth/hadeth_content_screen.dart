import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_args.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethContentScreen extends StatelessWidget {
  static const String routeName = '/hadeth';
  const HadethContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethArgs args = ModalRoute.of(context)!.settings.arguments as HadethArgs;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/${settingsProvider.backgroundImageName}.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.hadeth),
          ),
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
                  Text(
                    args.hadethTitel,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: settingsProvider.themeMode == ThemeMode.light
                        ? AppTheme.black
                        : AppTheme.gold),
                  ),
                   Divider(
                    color: settingsProvider.themeMode == ThemeMode.light
                        ? AppTheme.lightPrimary
                        : AppTheme.gold,
                    endIndent: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                        args.hadethContent[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      itemCount: args.hadethContent.length,
                    ),
                  ),
                ],
              )),
        ));
  }
}
