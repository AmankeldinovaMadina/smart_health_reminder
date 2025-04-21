import 'package:flutter/material.dart';
import 'package:smart_health_assistant/screens/hydration_page.dart';
import 'package:smart_health_assistant/screens/meditation_page.dart';
import 'package:smart_health_assistant/screens/posture_page.dart';
import 'package:smart_health_assistant/screens/step_counter_page.dart';
import 'package:smart_health_assistant/widgets/feature_tile.dart';
import '../widgets/points_card.dart';
import '../widgets/leaderboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.person_outline, size: 28, color: Colors.green[300]),
              ),
              const SizedBox(height: 24),

              
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              FeatureTile(
                imagePath: 'assets/hydration_icon.png',
                label: 'Hydration',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const HydrationPage()));
                },
              ),
              FeatureTile(
                imagePath: 'assets/step_cnt_icon.png',
                label: 'Step counter',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const StepCounterPage()));
                },
              ),
              FeatureTile(
                imagePath: 'assets/posture_icon.png',
                label: 'Posture',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PosturePage()));
                },
              ),
              FeatureTile(
                imagePath: 'assets/meditation_icon.png',
                label: 'Meditation',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MeditationPage()));
                },
              ),
            ],
          ),
              const SizedBox(height: 24),
              const PointsCard(),
              const SizedBox(height: 24),
              const Leaderboard(),
            ],
          ),
        ),
      ),
    );
  }
}
