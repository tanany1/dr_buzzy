import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoInfo {
  final String title;
  final String youtubeId;
  final String url;

  VideoInfo({
    required this.title,
    required this.youtubeId,
    required this.url,
  });
}

class AwarenessScreen extends StatefulWidget {
  const AwarenessScreen({super.key});

  @override
  State<AwarenessScreen> createState() => _AwarenessScreenState();
}

class _AwarenessScreenState extends State<AwarenessScreen> {
  final List<VideoInfo> videos = [
    VideoInfo(
      title: "Get Germ-Free with Dr. Buzzy:Handwashing Fun! 🤲🏻🐝",
      youtubeId: "wmbGEhoGXhk",
      url: "https://www.youtube.com/watch?v=wmbGEhoGXhk",
    ),
    VideoInfo(
      title: "Dr.Buzzy is here to tell a gentle story about Hand , foot and mouth helping children understand 🐝🌟",
      youtubeId: "riY9OVdqMJU",
      url: "https://www.youtube.com/watch?v=riY9OVdqMJU",
    ),
    VideoInfo(
      title: "Dr. Buzzy's Amazing Anemia Adventure! 💪🏻🐝",
      youtubeId: "IFcKkINC9K8",
      url: "https://www.youtube.com/watch?v=IFcKkINC9K8",
    ),
    VideoInfo(
      title: "Dr. Buzzy give to you some tips keeping you healthy and active 🏃🏻‍➡️🐝",
      youtubeId: "Xd-bfV2D1uk",
      url: "https://www.youtube.com/watch?v=Xd-bfV2D1uk",
    ),
    VideoInfo(
      title: "Dr. Buzzy give you some advice about chicken pox that keep you clean and active 🐝",
      youtubeId: "pABX7WVJ_JM",
      url: "https://www.youtube.com/watch?v=pABX7WVJ_JM",
    ),
    VideoInfo(
      title: "Dr. Buzzy guide you how to recognise chicken pox and hand , foot and mouth in first of appearance 🐝",
      youtubeId: "oH7O1tdet6Q",
      url: "https://www.youtube.com/watch?v=oH7O1tdet6Q",
    ),
    VideoInfo(
      title: "How are you properly take your dose of insulin? 💉",
      youtubeId: "YfvnAPPGTXw",
      url: "https://www.youtube.com/watch?v=YfvnAPPGTXw",
    ),
    VideoInfo(
      title: "Dr. Buzzy give you some tips for Diabetes 🐝✅",
      youtubeId: "iaGXQN7CVcE",
      url: "https://www.youtube.com/watch?v=iaGXQN7CVcE",
    ),
  ];

  Map<String, bool> isExpanded = {};

  @override
  void initState() {
    super.initState();
    // Initialize expansion state for each video
    for (var video in videos) {
      isExpanded[video.title] = false;
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: videos.map((video) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Card(
                    color: Colors.yellow[600],
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            video.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(
                            isExpanded[video.title]!
                                ? Icons.expand_less
                                : Icons.expand_more,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              isExpanded[video.title] = !isExpanded[video.title]!;
                            });
                          },
                        ),
                        if (isExpanded[video.title]!)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.network(
                                    'https://img.youtube.com/vi/${video.youtubeId}/maxresdefault.jpg',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                        'https://img.youtube.com/vi/${video.youtubeId}/hqdefault.jpg',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              color: Colors.grey,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextButton(
                                  onPressed: () => _launchURL(video.url),
                                  child: const Text(
                                    'Watch Video on YouTube',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.yellow[50],
    );
  }
}