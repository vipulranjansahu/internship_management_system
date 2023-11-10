import 'package:flutter/material.dart';
import 'package:internship_management/screens/loginscreen.dart';
import 'package:internship_management/widgets/my_card.dart';
import 'package:internship_management/networking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map<String,dynamic>mp={};

  Future getData()async{

    mp = await func.getAllintern();
  }
 // asdawdasd
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
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Hi, Samarth",
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(onPressed: ()async{
                    await func.logout();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginpage()));
                  }, icon: Icon(Icons.logout))
                ],
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
                            return MyCard(status: "Available",name: mp["internships"][index]["name"],start: mp["internships"][index]["startDate"],stipend: mp["internships"][index]["stipend"],dur: mp["internships"][index]["endDate"],mode: mp["internships"][index]["mode"],prof: mp["faculty"][index],faculty: 2,id: mp["internships"][index]["_id"],);

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


