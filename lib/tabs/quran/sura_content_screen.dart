import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/tabs/quran/quran_tab.dart';
import 'package:islamic_app/widget/loading_indicator.dart';

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
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/dafault_background.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('إسلامي'),
          ),
          body: Container(
              padding: const EdgeInsets.all(25),
              margin: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: MediaQuery.sizeOf(context).height * 0.07),
              decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ' سورة ${args.suraName}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: Icon(
                          Icons.play_circle,
                          color: AppTheme.black,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: AppTheme.lightPrimary,
                    endIndent: 20,
                  ),
                  ayat.isEmpty
                      ? const LoadingIndicator()
                      : Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => Text(
                              ayat[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            itemCount: ayat.length,
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
