import 'package:flutter/material.dart';
import 'package:internship_management/networking.dart';

import '../widgets/my_card.dart';

class ProffesorInterns extends StatefulWidget {

  String id;
  String name;
  int faculty;
  ProffesorInterns({required this.id,required this.name,required this.faculty});

  @override
  State<ProffesorInterns> createState() => _ProffesorInternsState();
}

class _ProffesorInternsState extends State<ProffesorInterns> {

  Map<String,dynamic>mp={};

  Future getData()async{
    mp = await func.getAllFacultyInterns(widget.id);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SafeArea(
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
                Text(
                  "${widget.name}'s Internships",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: mp["internships"].length,
                            itemBuilder: (context, index) {
                              return MyCard(status: "Available",name: mp["internships"][index]["name"],start: mp["internships"][index]["startDate"],stipend: mp["internships"][index]["stipend"],dur: mp["internships"][index]["endDate"],mode: mp["internships"][index]["mode"],prof: widget.name,faculty: widget.faculty,id: mp["internships"][index]["_id"],);

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
      ),
    );;
  }
}
