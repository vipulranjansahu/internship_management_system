import 'package:flutter/material.dart';
import 'package:internship_management/widgets/prof_card.dart';
import 'package:internship_management/networking.dart';

class Proffesor_Page extends StatefulWidget {
  const Proffesor_Page({Key? key}) : super(key: key);

  @override
  _Proffesor_PageState createState() => _Proffesor_PageState();
}

class _Proffesor_PageState extends State<Proffesor_Page> {

  Map<String,dynamic>mp={};

  Future getData()async {
    mp = await func.getAllFaculty();
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
              Text("All Professors",style: TextStyle(fontSize: 24),),
              SizedBox(
                height: 30,
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: mp["faculty"].length,
                          itemBuilder: (context, index) {
                            return ProffCard(name: mp["faculty"][index]["name"],des: mp["faculty"][index]["description"],link: mp["faculty"][index]["siteLink"],contact: mp["faculty"][index]["contactNo"],num: mp["faculty"][index]["internshipsOpened"].length.toString(),qualifications:mp["faculty"][index]["qualifications"],id: mp["faculty"][index]["_id"],faculty: 2,);

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
