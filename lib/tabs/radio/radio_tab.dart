import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_image.png'),
        SizedBox(height: screenHeight * 0.08),
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: screenHeight * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.skip_previous,
              color: AppTheme.lightPrimary,
              size: 35,
            ),
            SizedBox(width: screenWidth * 0.1,),
             const Icon(
              Icons.play_arrow_rounded,
              color: AppTheme.lightPrimary,
              size: 70,
            ),
            SizedBox(width: screenWidth * 0.1,),
             const Icon(
              Icons.skip_next,
              color: AppTheme.lightPrimary,
              size: 35,
            ),
          ],
        )
      ],
    );
  }
}
