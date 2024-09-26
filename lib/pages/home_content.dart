import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
        elevation: 0.7, // Set elevation for the AppBar
      ),
      body: const Center(
        child: Text('Home Page Content', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}