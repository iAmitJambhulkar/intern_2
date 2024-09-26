import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../PortfolioContent/achievement_content.dart';
import '../PortfolioContent/project_content.dart';
import '../PortfolioContent/saved_content.dart';
import '../PortfolioContent/shared_content.dart';

class PortfolioContent extends StatelessWidget {
  const PortfolioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Portfolio',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.7,
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/ic_round-shopping-bag.svg',
                color: const Color.fromARGB(255, 223, 85, 50),
                width: 24,
                height: 24,
              ),
              onPressed: () => print('Bag icon pressed'),
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/ic_baseline-notifications.svg',
                color: const Color.fromARGB(255, 223, 85, 50),
                width: 24,
                height: 24,
              ),
              onPressed: () => print('Bell icon pressed'),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Projects'),
              Tab(text: 'Saved'),
              Tab(text: 'Shared'),
              Tab(text: 'Achievement'),
            ],
            indicatorWeight: 3.0,
            labelPadding: EdgeInsets.zero,
            labelColor: Color.fromARGB(255, 223, 85, 50),
            indicatorColor: Color.fromARGB(255, 223, 85, 50),
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: const TabBarView(
          children: [
            ProjectsContent(),
            SavedContent(),
            SharedContent(),
            AchievementContent(),
          ],
        ),
      ),
    );
  }
}
