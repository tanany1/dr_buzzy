import 'package:flutter/material.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Replace with your background asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 350,
            child: Center(
              child: Image.asset(
                'assets/dr_buzz_logo.png', // Replace with your image asset
                fit: BoxFit.contain,
                height: 500,
                width: 500,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 10,
            child: Container(
              width: 340, // Adjusted width to fit text better
              height: 250, // Adjusted height to fit text better
              child: Stack(
                children: [
                  Image.asset(
                    'assets/speech_bubble_image.png',
                    // Replace with the provided image path
                    fit: BoxFit.cover,
                    width: 340,
                    height: 250,
                  ),
                  Center(
                    child: Container(
                      width: 250,
                      height: 200,
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Welcome Heroes! We're so excited to have you in Dr. Buzzy."
                                " This app is your guide to staying happy and healthy with helpful tips!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15, // Reduced font size for better fit
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 6, // Limit lines to fit bubble
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  minimumSize: const Size(160, 60),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: const Text(
                  'Start',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}