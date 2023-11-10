import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internship_management/networking.dart';
import 'package:internship_management/screens/internship_page.dart';

class MyCard extends StatelessWidget {
  String status;
  String name;
  String prof;
  String start;
  String dur;
  String stipend;
  String mode;
  int faculty;
  String id;
  MyCard({required this.status,required this.mode,required this.stipend,required this.dur,required this.start,required this.prof,required this.name,required this.faculty,required this.id});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        Map<String,dynamic>mp;
        mp = await func.getinterndata(id);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InternshipScreen(faculty: faculty,data: mp,)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: const Color(0xFFD0D0D0),
          elevation: 8,
          child: Container(
            color: Color(0xffDEE0E0),
            height: MediaQuery.of(context).size.height / 3.75,
            // width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        //clipBehavior: Clip.antiAlias,
                        child: Image(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width / 9,
                          image: const AssetImage("images/img.jpg"),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Expanded(
                        child: ListTile(
                          title:  Text(name),
                          subtitle: Text(prof),
                          trailing: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: (status == "Accepted" ||
                                          status == "Available" || status == "Active")
                                      ? Colors.green
                                      : ((status == "Pending")
                                          ? Colors.grey
                                          : Colors.red)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                child: Text(
                                  "$status",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children:  [
                              FaIcon(
                                FontAwesomeIcons.circlePlay,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Start on : ${start.substring(0,10) }"),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendar,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("End date : ${dur.substring(0,10)}"),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children:  [
                              FaIcon(
                                FontAwesomeIcons.moneyBill1Wave,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Stipend: $stipend"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.house,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(mode),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
