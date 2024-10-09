import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_args.dart';

class HadethContentScreen extends StatelessWidget {
  static const String routeName = '/hadeth';
  const HadethContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethArgs args = ModalRoute.of(context)!.settings.arguments as HadethArgs ;
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
                  Text(
                    args.hadethTitel,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Divider(
                    color: AppTheme.lightPrimary,
                    endIndent: 20,
                  ),
                  const SizedBox(height: 20,),
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
        )
        );
}
}