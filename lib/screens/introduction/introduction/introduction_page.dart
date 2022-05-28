import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/config/route_name.dart';
import 'package:quran_app/config/theme.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Al-Quran Apps',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Sesibuk apakah kamu sampai belum membaca Al-Quran?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 300,
                  height: 300,
                  child: Lottie.asset(
                    'assets/lotties/animasi-quran.json',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, RouteName.home),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppColors.purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.purpleColor
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
