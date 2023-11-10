import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internship_management/networking.dart';
import '../widgets/my_card.dart';
import 'package:internship_management/screens/applied_interns.dart';
import 'package:internship_management/screens/proffesor_page.dart';
import 'package:internship_management/screens/profile_page.dart';
import 'package:internship_management/screens/chat_page.dart';
import 'package:internship_management/screens/homescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = [
    HomeScreen(),
    Applied_Interns(),
    Proffesor_Page(),
    ChatPage(),
    Profile_Page(id: userId,)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFFa8a8bd),
        selectedItemColor: Color(0xFF304675),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimney), label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.newspaper), label: "My Interns"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userTie), label: "Proffesors"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.comment), label: "chat"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: "Profile"),
        ],
      ),
    );
  }
}
