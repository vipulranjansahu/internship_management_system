import 'package:flutter/material.dart';
import 'package:internship_management/widgets/my_card.dart';
import 'package:internship_management/networking.dart';

class Applied_Interns extends StatefulWidget {
  const Applied_Interns({Key? key}) : super(key: key);

  @override
  _Applied_InternsState createState() => _Applied_InternsState();
}

class _Applied_InternsState extends State<Applied_Interns> {
  Map<String, dynamic> mp = {};

  Future getData() async {
    mp = await func.getmyinterns();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/img.jpg'),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'My Internships',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: mp["student"].length,
                          itemBuilder: (context, index) {
                            return MyCard(
                              status: (mp["student"][index]["status"] == "R") ? "Closed" : (mp["student"][index]["status"] == "A")? "Accepted" : "Pending" ,
                              name: mp["internships"][index]["name"],
                              start: mp["internships"][index]["startDate"],
                              stipend: mp["internships"][index]["stipend"],
                              dur: mp["internships"][index]["endDate"],
                              mode: mp["internships"][index]["mode"],
                              prof: mp["faculty"][index],
                              faculty: 2,
                              id: mp["student"][index]["id"],
                            );
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
