import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internship_management/networking.dart';
import 'package:internship_management/screens/prof_interns.dart';

class ProffCard extends StatelessWidget {

  String name;
  List<dynamic>qualifications;
  String num;
  String des;
  String contact;
  String link;
  String id;
  int faculty;

  ProffCard({required this.name,required this.num,required this.link,required this.contact,required this.des,required this.qualifications,required this.id,required this.faculty});

  @override
  Widget build(BuildContext context) {

    List<Widget>q=[];

    for(var i in qualifications){

      q.add(Text(i["qualification"] + " "));

    }


    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProffesorInterns(id: id, name: name,faculty:(faculty==1) ? 3 : 2,)));
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          title: Text(name),
                          subtitle: Row(children: q,),
                          trailing: Container(
                            width: MediaQuery.of(context).size.width/4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                child: Text(
                                  "Internships Opened : $num",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Center(child: Text(des,style: TextStyle(fontSize: 16),)),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5,horizontal: 20),
                  child: Text("Contact No. : $contact",style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5,horizontal: 20),
                  child: Text("Website : $link",style: TextStyle(fontSize: 16),),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
