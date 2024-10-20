import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/cache_data.dart';
import 'package:islamic_app/home_screen.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islamic_app/tabs/quran/sura_content_screen.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await CacheData.initializeCache();
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        final provider = SettingsProvider();
        provider.themeMode = CacheData.getMode() == false ? ThemeMode.light : ThemeMode.dark;
        provider.languageCode = CacheData.getlanguage('language');
        return provider;
      },
      child: const IslamiApp(),
    ),
  );
}


class IslamiApp extends StatefulWidget {
  const IslamiApp({super.key});

  @override
  State<IslamiApp> createState() => _IslamiAppState();
}

class _IslamiAppState extends State<IslamiApp> {
@override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      FlutterNativeSplash.remove();
    });
  }
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraContentScreen.routeName: (context) => const SuraContentScreen(),
        HadethContentScreen.routeName: (context) => const HadethContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
    );
  }
}
