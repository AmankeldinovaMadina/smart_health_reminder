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
              // Top bar with back, title, and points
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Text(
                    'Meditation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white),
                        color: Color(0xFF52C380),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
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
                  ),
              const SizedBox(height: 16),

              // Target & Completed
              Padding(
                padding: const EdgeInsets.only(left: 16), 
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _statusCard(title: 'Target', value: '10 minutes', isTarget: true),
                      const SizedBox(width: 16),
                      _statusCard(title: '🍃 Completed', value: '6 minutes', isTarget: false),
                    ],
                  ),
                ),
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
                          Color(0xFF52C380),
                          Color(0xFF307880),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), 
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double totalWidth = constraints.maxWidth;
                    double spacing = 12;
                    int buttonCount = 3;

                    // Subtract total spacing between buttons
                    double buttonWidth = (totalWidth - spacing * (buttonCount - 1)) / buttonCount;

                    return Row(
                      children: [
                        _TimeButton(label: '1 min', active: true, width: buttonWidth),
                        SizedBox(width: spacing),
                        _TimeButton(label: '2 min', width: buttonWidth),
                        SizedBox(width: spacing),
                        _TimeButton(label: '3 min', width: buttonWidth),
                      ],
                    );
                  },
                ),
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

Widget _statusCard({
  required String title,
  required String value,
  required bool isTarget,
}) {
  return IntrinsicWidth(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600, // semi-bold
              fontSize: 12,
              color: Color(0xFF9CA3AF), // light gray
            ),
          ),
          const SizedBox(height: 6),

          // Value and icon
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 6),
              isTarget
                  ? Image.asset(
                      'assets/change_icon.png',
                      width: 16,
                      height: 16,
                    )
                  : const Text('', style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

}

class _TimeButton extends StatelessWidget {
  final String label;
  final bool active;
  final double width;

  const _TimeButton({
    required this.label,
    this.active = false,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final Color baseColor = const Color(0xFF62B67C);

    return SizedBox(
      width: width,
      height: 48,
      child: Container(
        decoration: BoxDecoration(
          color: active
              ? Colors.white.withOpacity(0.2)
              : baseColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(1,6), // 👈 move shadow downward
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time,
              size: 18,
              color: active ? Colors.white : baseColor,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: active ? Colors.white : baseColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _DayIndicator extends StatelessWidget {
  final String day;
  final bool filled;

  const _DayIndicator({
    required this.day,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF52C380);

    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xFF90A4AE), // soft blue-gray like in image
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? green : Colors.transparent,
            border: filled
                ? null
                : Border.all(
                    color: green.withOpacity(0.2),
                    width: 2,
                  ),
          ),
        ),
      ],
    );
  }
}
