import 'package:flutter/material.dart';
import 'package:internship_management/networking.dart';
import 'package:internship_management/networking.dart';

class Profile_Page extends StatefulWidget {

  String id;
  Profile_Page({required this.id});

  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {

  List<Widget>skills = [];
  Map<String,dynamic>profile={};
  Future getData()async{
    profile = await func.getUserprofile(widget.id);

    for(var i in profile["user"]["abilities"]){
      skills.add(Text(i["ability"] + ", ",style: TextStyle(fontSize: 20),));
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
                                Text("${profile["user"]["degree"]}, ${profile["user"]["currentSem"]} Semester",style: TextStyle(fontSize: 17,color: Colors.white70,fontWeight: FontWeight.w400),),
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
                            child: Text("Enrollment No.",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Branch",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Degree",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Current Semester",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Year Of Graduation",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Institute ",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Skills ",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Resume ",style: TextStyle(fontSize: 20),),
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
                            child: Text(":  ${profile["user"]["enrollment"]}",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["user"]["branch"]}",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["user"]["degree"]}",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["user"]["currentSem"]}",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["user"]["yearOfGrad"]}",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["user"]["institute"]}",style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(":  "),
                                Row(
                                    children: skills
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":  ${profile["user"]["resume"]}",style: TextStyle(fontSize: 20),),
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

