import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/cache_data.dart';
import 'package:islamic_app/tabs/settings/language.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
  List<Language> languages = [
    Language(name:  AppLocalizations.of(context)!.english, code: 'en'),
    Language(name: AppLocalizations.of(context)!.arabic, code: 'ar')
  ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.dark_mode,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: settingsProvider.themeMode == ThemeMode.light
                        ? AppTheme.black
                        : AppTheme.gold),
              ),
              Switch(
                value: settingsProvider.isDark,
                onChanged: (isDark) => {
                  settingsProvider
                      .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light),
                  CacheData.setMode(value: isDark)
                },
                activeColor: AppTheme.darkPrimary,
                activeTrackColor: AppTheme.gold,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: settingsProvider.themeMode == ThemeMode.light
                        ? AppTheme.black
                        : AppTheme.gold),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languages.firstWhere(
                    (language) =>
                        language.code == settingsProvider.languageCode,
                  ),
                  items: languages
                      .map(
                        (language) => DropdownMenuItem<Language>(
                          value: language,
                          child: Text(language.name),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedLanguage) => {
                    (settingsProvider.changeLanguage(selectedLanguage!.code)),
                    CacheData.setlanguage(value: selectedLanguage.code)
                  },
                  dropdownColor: settingsProvider.themeMode == ThemeMode.light
                      ? AppTheme.lightPrimary
                      : AppTheme.black,
                  iconEnabledColor: AppTheme.gold,
                  iconDisabledColor: AppTheme.gold,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: settingsProvider.themeMode == ThemeMode.light
                          ? AppTheme.black
                          : AppTheme.gold),
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
