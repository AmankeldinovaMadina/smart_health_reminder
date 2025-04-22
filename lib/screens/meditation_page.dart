import 'package:flutter/material.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF77CBA6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top bar with back arrow and title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  const Text(
                    'Meditation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: const Row(
                      children: [
                        Text('⭐', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 4),
                        Text(
                          '150 points',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Target & Completed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _statusCard(title: 'Target', value: '10 minutes', icon: Icons.flag),
                  const SizedBox(width: 16),
                  _statusCard(title: 'Completed', value: '6 minutes', icon: Icons.spa),
                ],
              ),
              const SizedBox(height: 24),

              // Start Button
              Expanded(
                child: Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF52C380), // 17%
                          Color(0xFF307880), // 100%
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'start',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // Time Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _TimeButton(label: '1 min', active: true),
                  SizedBox(width: 12),
                  _TimeButton(label: '2 min'),
                  SizedBox(width: 12),
                  _TimeButton(label: '3 min'),
                ],
              ),

              const SizedBox(height: 16),
              const Text(
                '+ 5 points for completing breathing practice!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '2 - Day Streak! Keep it up',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 24),
              // Streak calendar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _DayIndicator(day: 'Mon', filled: true),
                        _DayIndicator(day: 'Tue'),
                        _DayIndicator(day: 'Wed'),
                        _DayIndicator(day: 'Thu', filled: true),
                        _DayIndicator(day: 'Fri'),
                        _DayIndicator(day: 'Sat', filled: true),
                        _DayIndicator(day: 'Sun', filled: true),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.green),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusCard({required String title, required String value, required IconData icon}) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 4),
              Icon(icon, size: 16, color: Colors.black54),
            ],
          ),
        ],
      ),
    );
  }
}

// Time selection button
class _TimeButton extends StatelessWidget {
  final String label;
  final bool active;

  const _TimeButton({required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: active
            ? [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 6,
                )
              ]
            : null,
      ),
      child: Row(
        children: [
          const Icon(Icons.timer, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Day tracker
class _DayIndicator extends StatelessWidget {
  final String day;
  final bool filled;

  const _DayIndicator({required this.day, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? const Color(0xFF66BB6A) : Colors.grey.shade200,
            border: Border.all(color: Colors.grey.shade400),
          ),
        ),
      ],
    );
  }
}
