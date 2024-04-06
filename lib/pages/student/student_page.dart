import 'package:flutter/material.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/icons.dart';
import '../course/course_page.dart';
import '../profile/profile_page.dart';
import 'dashboard_page.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) => const StudentPage(),
      settings: settings,
    );
  }

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const CoursePage(),
    const DashboardPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: ColorName.primary,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.chart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.profile),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
