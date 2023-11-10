import 'package:flutter/material.dart';
import 'package:internship_management/screens/faculty/add_internship.dart';
import 'package:internship_management/widgets/my_card.dart';
import 'package:internship_management/networking.dart';

import '../loginscreen.dart';

class FacultyHomeScreen extends StatefulWidget {
  const FacultyHomeScreen({Key? key}) : super(key: key);

  @override
  _FacultyHomeScreenState createState() => _FacultyHomeScreenState();
}

class _FacultyHomeScreenState extends State<FacultyHomeScreen> {

  Map<String,dynamic>mp={};
  Future getData()async{
    mp = await func.getAllFacultyInternsHome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color(0xFF2193b0).withOpacity(0.3),
        //       //Colors.white,
        //       Colors.white
        //     ],
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/img.jpg"),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Welcome, Dr.Rahul Kala",
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(onPressed: ()async{
                    await func.logout();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginpage()));
                  }, icon: Icon(Icons.logout))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddInternship()));
                  },
                  child: const Text("+ Add New Internship",style: TextStyle(color: Color(0xFF304675),fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2,color:Color(0xFF304675) ),
                    primary:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                    ),
                    minimumSize: Size(250,42)
                  ),
                ),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: mp["internships"].length,
                          itemBuilder: (context, index) {
                            return MyCard(status: mp["internships"][index]["isAvailable"] ? "Available" : "Closed",name: mp["internships"][index]["name"],start: mp["internships"][index]["startDate"],stipend: mp["internships"][index]["stipend"],dur: mp["internships"][index]["endDate"],mode: mp["internships"][index]["mode"],prof: "Dr. Rahul kala",faculty: 1,id: mp["internships"][index]["_id"],);

                          }),
                    );
                  }

                  print(snapshot.connectionState);
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                future: getData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//asdawd