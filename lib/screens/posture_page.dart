import 'package:flutter/material.dart';

class PosturePage extends StatelessWidget {
  const PosturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posture')),
      body: const Center(child: Text('Posture Feature Page')),
    );
  }
}
