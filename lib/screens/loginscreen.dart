import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_management/networking.dart';
import 'package:internship_management/screens/faculty/faculty_homepage.dart';
import 'package:internship_management/screens/faculty_signup.dart';
import 'package:internship_management/screens/homepage.dart';
import 'package:internship_management/screens/signupscreen.dart';


const ktextfield = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email = "";
  String password = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Color(0xFF304675),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration:ktextfield.copyWith(hintText: "Email")
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration:ktextfield.copyWith(hintText: "password")
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {

                  if (await func.signin(email, password)) {
                    //await func.profileinfo(email);
                    //String name = await func.userpower();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>(isfac) ? FacultyHome() : HomePage()));

                  } else {
                    const snackbar = SnackBar(
                      backgroundColor: Colors.blueGrey,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        "Incorrect User Credentials",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF304675),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(315, 42),
                ),
                child: const Text("Log In"),
              ),
            ),
            Text("Not a member? "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,5,20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: const Text("Sign Up As Student",style: TextStyle(color: Color(0xFF304675)),),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2,color:Color(0xFF304675) ),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(150,42)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,0,20,20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FacultySignUpPage()));
                    },
                    child: const Text("Sign Up As Faculty",style: TextStyle(color: Color(0xFF304675)),),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2,color:Color(0xFF304675) ),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(150,42)
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}