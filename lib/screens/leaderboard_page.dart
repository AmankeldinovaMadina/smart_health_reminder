import 'package:flutter/material.dart';
import 'package:smart_health_assistant/widgets/leaderboard.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Top Performers',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                LeaderboardPodium(name: 'Dias', score: '2,569 QP', position: 2, height: 120),
                SizedBox(width: 12),
                LeaderboardPodium(name: 'Madina', score: '2,569 QP', position: 1, height: 160, isWinner: true),
                SizedBox(width: 12),
                LeaderboardPodium(name: 'Madi', score: '2,569 QP', position: 3, height: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
