import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_screen.dart';
import 'registration_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkRegistrationStatus();
  }

  _checkRegistrationStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user_name');
    final age = prefs.getString('user_age');
    final gender = prefs.getString('user_gender');

    bool isRegistered = name != null &&
        name.isNotEmpty &&
        age != null &&
        gender != null;

    if (isRegistered) {
      // User is already registered, go to onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    } else {
      // User is not registered, go to registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegistrationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/dr_buzz_logo.png',
          fit: BoxFit.contain,
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}