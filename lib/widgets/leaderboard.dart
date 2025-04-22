import 'package:flutter/material.dart';
import 'package:smart_health_assistant/screens/leaderboard_page.dart';


class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Leaderboard',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF66BB6A),
          ),
        ),
        const SizedBox(height: 16),

        // Entire preview is a button
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LeaderboardPage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                LeaderboardPodium(name: 'Dias', score: '2,569 QP', position: 2, height: 100),
                SizedBox(width: 12),
                LeaderboardPodium(name: 'Madina', score: '2,569 QP', position: 1, height: 140, isWinner: true),
                SizedBox(width: 12),
                LeaderboardPodium(name: 'Madi', score: '2,569 QP', position: 3, height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class LeaderboardPodium extends StatelessWidget {
  final String name;
  final String score;
  final int position;
  final double height;
  final bool isWinner;

  const LeaderboardPodium({
    super.key,
    required this.name,
    required this.score,
    required this.position,
    required this.height,
    this.isWinner = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isWinner)
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Icon(Icons.emoji_events, color: Colors.amber, size: 20),
          ),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue),
        ),
        const SizedBox(height: 4),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Color(0xFF4CAF50),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            score,
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: height,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: position == 1
                  ? [Color(0xFFB2EBF2), Color(0xFF4DD0E1)]
                  : [Color(0xFF81C784), Color(0xFF66BB6A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Text(
            '$position',
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
