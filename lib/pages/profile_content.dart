import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
        elevation: 0.7,

      ),
      body: const Center(
        child: Text('Profile Page Content', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}