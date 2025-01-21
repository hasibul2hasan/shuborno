import 'package:flutter/material.dart';
import 'package:shuborno/pages/game.dart';
import 'package:shuborno/pages/hotline.dart';
// import '../sign_in_page.dart';
// import '../telemedicine_page.dart';
// import '../jobs_page.dart';
// import '../games_page.dart';
// import '../audiobook_page.dart';
// import '../translate_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHUBORNO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Two buttons per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            FeatureButton(
              text: 'Sign In',
              icon: Icons.login,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignInPage()),
                // );
              },
            ),
            FeatureButton(
              text: 'Hotline',
              icon: Icons.phone,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotlinePage()),
                );
              },
            ),
            FeatureButton(
              text: 'Telemedicine',
              icon: Icons.local_hospital,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => TelemedicinePage()),
                // );
              },
            ),
            FeatureButton(
              text: 'Jobs',
              icon: Icons.work,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => JobsPage()),
                // );
              },
            ),
            FeatureButton(
              text: 'Games',
              icon: Icons.sports_esports,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamesPage()),
                );
              },
            ),
            FeatureButton(
              text: 'Audiobooks',
              icon: Icons.headset,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AudiobookPage()),
                // );
              },
            ),
            FeatureButton(
              text: 'Translate',
              icon: Icons.translate,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => TranslatePage()),
                // );
              },
            ),
            // Placeholder buttons for future features
            FeatureButton(
              text: 'Feature 8',
              icon: Icons.featured_video,
              onPressed: () {
                // Add functionality later
              },
            ),
            FeatureButton(
              text: 'Feature 9',
              icon: Icons.featured_play_list,
              onPressed: () {
                // Add functionality later
              },
            ),
            FeatureButton(
              text: 'Feature 10',
              icon: Icons.extension,
              onPressed: () {
                // Add functionality later
              },
            ),
            FeatureButton(
              text: 'Feature 11',
              icon: Icons.build,
              onPressed: () {
                // Add functionality later
              },
            ),
            FeatureButton(
              text: 'Feature 12',
              icon: Icons.more_horiz,
              onPressed: () {
                // Add functionality later
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const FeatureButton({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
