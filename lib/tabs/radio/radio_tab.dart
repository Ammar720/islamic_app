import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
  SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_image.png'),
        SizedBox(height: screenHeight * 0.08),
        Text(
           AppLocalizations.of(context)!.quran_radio,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: screenHeight * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
              Icons.skip_previous,
              color:settingsProvider.themeMode == ThemeMode.light
                        ? AppTheme.lightPrimary
                        : AppTheme.gold,
              size: 35,
            ),
            SizedBox(width: screenWidth * 0.1,),
              Icon(
              Icons.play_arrow_rounded,
              color:settingsProvider.themeMode == ThemeMode.light
                        ? AppTheme.lightPrimary
                        : AppTheme.gold,
              size: 70,
            ),
            SizedBox(width: screenWidth * 0.1,),
              Icon(
              Icons.skip_next,
              color: settingsProvider.themeMode == ThemeMode.light
                        ? AppTheme.lightPrimary
                        : AppTheme.gold,
              size: 35,
            ),
          ],
        )
      ],
    );
  }
}
