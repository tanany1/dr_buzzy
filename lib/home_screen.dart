import 'package:dr_buzzy/awareness_screen.dart';
import 'package:flutter/material.dart';
import 'disease_info_screen.dart';
import 'profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Map<String, String>> diseases = [
    {'name': 'Diabetes Mellitus', 'image': 'assets/diabetes.png'},
    {'name': 'Obesity', 'image': 'assets/obesity.png'},
    {'name': 'Hand, Foot and Mouth', 'image': 'assets/hfm.png'},
    {'name': 'Chicken Pox', 'image': 'assets/chickenpox.png'},
    {'name': 'Anemia', 'image': 'assets/anemia.png'},
  ];

  final List<Map<String, String>> gameLinks = [
    {
      'name': 'Diabetes Mellitus Game',
      'link': 'https://learningapps.org/watch?v=pgcx7ec1t25',
      'image': 'assets/diabetes.png'
    },
    {
      'name': 'Obesity Game',
      'link': 'https://learningapps.org/watch?v=puxt74xxk25',
      'image': 'assets/obesity.png'
    },
    {
      'name': 'Hand, Foot and Mouth Game',
      'link': 'https://learningapps.org/watch?v=p4sp7ou5325',
      'image': 'assets/hfm.png'
    },
    {
      'name': 'Chicken Pox Game',
      'link': 'https://learningapps.org/watch?v=p7dj67cmt25',
      'image': 'assets/chickenpox.png'
    },
    {
      'name': 'Anemia Game',
      'link': 'https://learningapps.org/watch?v=p1ih4jrrj25',
      'image': 'assets/anemia.png'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _launchGameUrl(String url) async {
    try {
      final Uri uri = Uri.parse(url);

      // Show loading indicator
      _showLoadingMessage('Opening game...');

      // Try different launch modes in order of preference
      bool launched = false;

      // First try: Platform default (usually opens in browser)
      try {
        launched = await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
      } catch (e) {
        print('Platform default failed: $e');
      }

      // Second try: External application
      if (!launched) {
        try {
          launched = await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        } catch (e) {
          print('External application failed: $e');
        }
      }

      // Third try: In-app web view
      if (!launched) {
        try {
          launched = await launchUrl(
            uri,
            mode: LaunchMode.inAppWebView,
            webViewConfiguration: const WebViewConfiguration(
              enableJavaScript: true,
              enableDomStorage: true,
            ),
          );
        } catch (e) {
          print('In-app web view failed: $e');
        }
      }

      // Fourth try: Legacy method (for older versions)
      if (!launched) {
        try {
          if (await canLaunchUrl(uri)) {
            launched = await launchUrl(uri);
          }
        } catch (e) {
          print('Legacy method failed: $e');
        }
      }

      if (!launched) {
        _showErrorMessage('Unable to open game. Please install a web browser or check your internet connection.');
      }

    } catch (e) {
      _showErrorMessage('Error opening game: Please check your internet connection.');
      print('Launch URL Error: $e'); // For debugging
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void _showLoadingMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Text(message),
          ],
        ),
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildHomeTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: diseases.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.yellow[300],
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiseaseInfoScreen(
                    diseaseName: diseases[index]['name']!,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  diseases[index]['image']!,
                  height: 120,
                  width: 120,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    diseases[index]['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGamesTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: gameLinks.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.yellow[300],
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _launchGameUrl(gameLinks[index]['link']!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      gameLinks[index]['image']!,
                      height: 120,
                      width: 120,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                    // Play button overlay
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    gameLinks[index]['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Dr. Buzzy', style: TextStyle(fontSize: 28)),
        ),
        backgroundColor: Colors.yellow[700],
        elevation: 2,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildHomeTab(),
            _buildGamesTab(),
            AwarenessScreen(),
            const ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow[600],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Games'),
          BottomNavigationBarItem(icon: Icon(Icons.noise_aware), label: 'DR Buzzy'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}