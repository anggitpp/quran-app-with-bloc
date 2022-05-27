import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/config/route_name.dart';

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
            Container(
              width: 300,
              height: 300,
              child: Lottie.asset(
                'assets/lotties/animasi-quran.json',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, RouteName.home),
              child: Text('Get Started'),
            ),
          ],
        ),
      )),
    );
  }
}
