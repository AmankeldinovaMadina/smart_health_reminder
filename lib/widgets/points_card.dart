import 'package:flutter/material.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/plant_main_page_bg.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white.withOpacity(0.9),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('⭐', style: TextStyle(fontSize: 18)),
                SizedBox(width: 6),
                Text(
                  '150 points',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -24,
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/plant_lvl1.png',
                height: 120,
              ),
              const Positioned(
                bottom: -8,
                child: Text(
                  'Level 1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    shadows: [
                      Shadow(offset: Offset(0, 2), blurRadius: 4, color: Colors.black26),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
