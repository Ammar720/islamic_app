import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Column(
      children: [
        Stack(
          children: [
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: Image.asset(
                  'assets/images/head_seb7a.png',
                )),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: screenWidth * 0.093),
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
                    'assets/images/body_seb7a.png',
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: screenHeight * 0.04),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromRGBO(183, 148, 95, 0.569),
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
            color: AppTheme.lightPrimary,
          ),
          height: screenHeight * 0.05,
          width: screenWidth * 0.3,
          alignment: Alignment.center,
          child: Text(
            azkar[azkarIndex],
            style: GoogleFonts.inter(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w400,
                color: AppTheme.white),
          ),
        )
      ],
    );
  }
}
