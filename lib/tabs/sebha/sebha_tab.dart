import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  List<String> azkar = ['سبحان الله', 'الحمدلله', 'الله أكبر'];
  int azkarIndex = 0;
  int zekrCount = 0;
  double rotateAngle = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Stack(
          children: [
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: Image.asset(
                  settingsProvider.themeMode == ThemeMode.light
                      ? 'assets/images/head_seb7a.png'
                      : 'assets/images/head_seb7a_dark.png',
                )),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth * (settingsProvider.isDark ? 0.195 : 0.098)),
              child: GestureDetector(
                onTap: () => {
                  count++,
                  zekrCount++,
                  rotateAngle += 1 / 8,
                  if (zekrCount == 33)
                    {
                      zekrCount = 0,
                      azkarIndex++,
                      if (azkarIndex == 3) azkarIndex = 0,
                    },
                  setState(() {}),
                },
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 100),
                  turns: rotateAngle,
                  child: Image.asset(
                    settingsProvider.themeMode == ThemeMode.light
                        ? 'assets/images/body_seb7a.png'
                        : 'assets/images/body_seb7a_dark.png',
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: screenHeight *(settingsProvider.isDark ? 0.06 : 0.02)),
        Text(
          AppLocalizations.of(context)!.tasbeeh_number,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: screenHeight * 0.04),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: settingsProvider.themeMode == ThemeMode.light
                ? const Color.fromRGBO(183, 148, 95, 0.569)
                : AppTheme.darkPrimary,
          ),
          height: screenHeight * 0.1,
          width: screenWidth * 0.18,
          alignment: Alignment.center,
          child: Text(
            count.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: settingsProvider.isDark
                ? AppTheme.gold
                : AppTheme.lightPrimary,
          ),
          height: screenHeight * 0.05,
          width: screenWidth * 0.3,
          alignment: Alignment.center,
          child: Text(
            azkar[azkarIndex],
            style: GoogleFonts.inter(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w400,
                color: settingsProvider.themeMode == ThemeMode.light
                    ? AppTheme.white
                    : AppTheme.black),
          ),
        )
      ],
    );
  }
}
