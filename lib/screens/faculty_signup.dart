import 'package:flutter/material.dart';
import 'package:internship_management/screens/faculty/faculty_homepage.dart';

import '../networking.dart';
import 'homepage.dart';


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


class FacultySignUpPage extends StatefulWidget {
  const FacultySignUpPage({Key? key}) : super(key: key);

  @override
  _FacultySignUpPageState createState() => _FacultySignUpPageState();
}

class _FacultySignUpPageState extends State<FacultySignUpPage> {

  late String site,desc , name , number, email, pass;
  List<Map<String,String>>qualifications=[];
  List<Widget> sk = [];
  List<String> ski = [];
  int index2 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register as Faculty"),
        backgroundColor: Color(0xFF304675),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Name"),
                onChanged: (String value) {
                  name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Description"),
                onChanged: (String value) {
                  desc = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Site Link"),
                onChanged: (String value) {
                  site = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Qualifications :"),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: sk),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                  onPressed: () {
                    ski.add("");
                    sk.add(
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          decoration:
                          ktextfield.copyWith(hintText: "Qualification"),
                          onChanged: (String value) {
                            ski[index2] = value;
                          },
                        ),
                      ),
                    );
                    setState(() {
                      index2++;
                    });
                  },
                  child: Text("+Add Qualification")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Number"),
                onChanged: (String value) {
                  number = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: ktextfield.copyWith(hintText: "Email"),
                onChanged: (String value) {
                  email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: ktextfield.copyWith(hintText: "Password"),
                onChanged: (String value) {
                  pass = value;
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: () async {

                    for(var i in ski){
                      qualifications.add({"qualification" : i});
                    }

                    if (await func.signupFaculty(email, pass, name, desc, site, number, qualifications)) {
                      //await func.profileinfo(email);
                      //String name = await func.userpower();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FacultyHome()));

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
                    minimumSize: Size(250, 42),
                  ),
                  child: const Text("Register"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
