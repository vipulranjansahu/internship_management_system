import 'package:flutter/material.dart';
import 'package:internship_management/screens/faculty/faculty_chat_screen.dart';
import 'package:internship_management/screens/faculty/faculty_homepage.dart';
import 'package:internship_management/screens/internship_page.dart';
import 'package:internship_management/screens/loginscreen.dart';
import 'package:internship_management/screens/signupscreen.dart';

import 'widgets/my_card.dart';

import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Loginpage(),
    );
  }
}
