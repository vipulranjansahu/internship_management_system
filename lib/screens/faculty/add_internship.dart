import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'faculty_homepage.dart';
import 'package:internship_management/networking.dart';

const ktextfield = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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

class AddInternship extends StatefulWidget {
  const AddInternship({Key? key}) : super(key: key);

  @override
  _AddInternshipState createState() => _AddInternshipState();
}

class _AddInternshipState extends State<AddInternship> {
  String name = "";
  String start = "";
  String end = "";
  String course = "";
  String vacancies = "";
  String mode = "";
  String stipend = "";
  List<Map<String, String>> expec = [];
  String cg = "";
  List<Map<String, String>> skills = [];

  List<Widget> ex = [];
  List<String> exp = [];
  int index = -1;

  List<Widget> sk = [];
  List<String> ski = [];
  int index2 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Internship"),
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
                decoration: ktextfield.copyWith(hintText: "Start Date"),
                onChanged: (String value) {
                  start = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "End Date"),
                onChanged: (String value) {
                  end = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Course"),
                onChanged: (String value) {
                  course = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Stipend"),
                onChanged: (String value) {
                  stipend = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Mode"),
                onChanged: (String value) {
                  mode = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Vacancies"),
                onChanged: (String value) {
                  vacancies = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Expectations :"),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: ex),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                  onPressed: () {
                    exp.add("");
                    ex.add(
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          decoration:
                              ktextfield.copyWith(hintText: "Expectation"),
                          onChanged: (String value) {
                            exp[index] = value;
                          },
                        ),
                      ),
                    );
                    setState(() {
                      index++;
                    });
                  },
                  child: Text("+Add Expectation")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Requirements :"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: ktextfield.copyWith(hintText: "Cg"),
                onChanged: (String value) {
                  cg = value;
                },
              ),
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
                              ktextfield.copyWith(hintText: "skill"),
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
                  child: Text("+Add Skill")),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: () async{
                    print(exp);
                    for(var i in exp){
                      expec.add({"expectation" : i});
                    }
                    for(var i in ski){
                      skills.add({"skill" : i});
                    }
                    if (await func.addInternship(name, start, end, course, vacancies, expec, cg, skills,mode,stipend)) {
                      //await func.profileinfo(email);
                      //String name = await func.userpower();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FacultyHome()));

                    } else {
                      const snackbar = SnackBar(
                        backgroundColor: Colors.blueGrey,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "Something went wrong",
                          style: TextStyle(color: Colors.red),
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
