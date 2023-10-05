import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_app_1/presentation/screen/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#3A7FD5'),
      body: Center(
        child: Image.asset(
          'assets/Icons/edspert-logo.png',
        ),
      ),
    );
  }
}
