import 'package:flutter/material.dart';
import 'package:internship_management/networking.dart';
import 'package:internship_management/networking.dart';

class FacultyProfile extends StatefulWidget {

  @override
  _FacultyProfileState createState() => _FacultyProfileState();
}

class _FacultyProfileState extends State<FacultyProfile> {

  List<Widget>qualifications = [];
  Map<String,dynamic>profile={};
  Future getData()async{
    profile = await func.getFacultyprofile();

    for(var i in profile["user"]["qualifications"]){
      qualifications.add(Text(i["qualification"] + ", ",style: TextStyle(fontSize: 20),));
    }

  }

  @override
  Widget build(BuildContext context) {



    return SingleChildScrollView(
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF13547a),
                                Color(0xFF80d0c7),
                              ])),
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 7.25,
                      left: 14,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: CircleAvatar(
                              backgroundImage: AssetImage("images/img.jpg"),
                              radius: MediaQuery.of(context).size.width / 6,
                            ),
                            backgroundColor: Colors.white,
                            radius: MediaQuery.of(context).size.width / 5.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(profile["user"]["name"],style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),),
                                //Text("${profile["user"]["degree"]}, ${profile["user"]["currentSem"]} Semester",style: TextStyle(fontSize: 17,color: Colors.white70,fontWeight: FontWeight.w400),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height:  MediaQuery.of(context).size.width / 6,
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Email",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Contact No.",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Qualifications ",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Site Link ",style: TextStyle(fontSize: 20),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["email"]}",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["user"]["contactNo"]}",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(":  "),
                                Row(
                                    children: qualifications
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["user"]["siteLink"]}",style: TextStyle(fontSize: 20),),
                          ),

                        ],
                      ),
                    ),

                  ],
                )

              ],
            );
          }

          print(snapshot.connectionState);
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(),
      ),
    );
  }
}

