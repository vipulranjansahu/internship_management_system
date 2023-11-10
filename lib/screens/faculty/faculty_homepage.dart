import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internship_management/screens/faculty/faculty_chat.dart';
import 'package:internship_management/screens/faculty/faculty_homescreen.dart';
import 'package:internship_management/screens/faculty/faculty_proff.dart';
import 'package:internship_management/screens/faculty/faculty_profile.dart';
import 'package:internship_management/networking.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  _FacultyHomeState createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> _pages = [
    FacultyHomeScreen(),
    FacultyProff(),
    FacultyChat(),
    FacultyProfile()
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
              icon: FaIcon(FontAwesomeIcons.userTie), label: "Proffesors"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.comment), label: "chat"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: "Profile"),
        ],
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
