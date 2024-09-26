import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_2/pages/portfolio_content.dart';
import 'package:intern_2/pages/profile_content.dart';
import 'pages/home_content.dart';
import 'pages/input_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    PortfolioContent(),
    InputContent(),
    ProfileContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getIconColor(int index) {
    return _selectedIndex == index
        ? const Color.fromARGB(255, 223, 85, 50)
        : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Home svg.svg',
                width: 24,
                height: 24,
                color: _getIconColor(0),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Portfolia svg.svg',
                width: 24,
                height: 24,
                color: _getIconColor(1),
              ),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Input svg.svg',
                width: 24,
                height: 24,
                color: _getIconColor(2),
              ),
              label: 'Input',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Profile svg.svg',
                width: 24,
                height: 24,
                color: _getIconColor(3),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 223, 85, 50),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
