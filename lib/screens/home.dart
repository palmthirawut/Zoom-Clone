import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/history_meeting.dart';
import 'package:zoom_clone/screens/meeting.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeeting(),
    const Center(child: Text('Contacts')),
    Center(
        child: CustomButton(
            text: 'Log Out', onPressed: () => AuthMethods().signOut())),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          'Meet & Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 123, 123, 123),
        onTap: onPageChange,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: 'Meet & Char'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings')
        ],
      ),
    );
  }
}
