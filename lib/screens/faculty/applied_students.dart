import 'package:flutter/material.dart';
import 'package:internship_management/networking.dart';
import 'package:internship_management/screens/general_profile_page.dart';

class AppliedStudentsPage extends StatefulWidget {

  String id;
  AppliedStudentsPage({required this.id});

  @override
  _AppliedStudentsPageState createState() => _AppliedStudentsPageState();
}

class _AppliedStudentsPageState extends State<AppliedStudentsPage> {

  Map<String,dynamic>mp={};

  Future getData()async{
    mp = await func.appliedStudents(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF304675),
        title: Text("Applied Students"),
      ),
      body:Column(
        children: [
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: mp["students"].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onLongPress: (){

                            showDialog(builder: (context)=>AlertBox2(id: mp["students"][index]["id"],),context: context);

                          },
                          onTap: (){
                            showDialog(builder: (context)=>AlertBox(stu_id:mp["students"][index]["id"] ,intern_id: widget.id,),context: context);
                          },
                          leading: CircleAvatar(backgroundImage: AssetImage("images/img.jpg"),),
                          title: Text(mp["profiles"][index]["name"]),
                          subtitle: Text(mp["profiles"][index]["currentSem"]+" Semester"),
                          trailing: TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>General_Profile_Page(id: mp["students"][index]["id"])));
                          },child: Text("View Profile"),),
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
    );
  }
}

class AlertBox extends StatelessWidget {

  AlertBox({required this.intern_id,required this.stu_id});

  String stu_id;
  String intern_id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text("Respond to Application"),
      content: Container(
        height: MediaQuery.of(context).size.height/5.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {

                await func.actionForIntern(stu_id, intern_id, "A");
                Navigator.pop(context);
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                        child: Text(
                          "Accept",
                          style: TextStyle(fontSize: 20),
                        )),
                  )),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                backgroundColor:
                MaterialStateProperty.all(Color(0xFF304675)),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: ()  async{

                await func.actionForIntern(stu_id, intern_id, "R");
                Navigator.pop(context);
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                        child: Text(
                          "Reject",
                          style: TextStyle(fontSize: 20,color: Color(0xFF304675)),
                        )),
                  )),
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(color: Color(0xFF304675))),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),

                ),
                backgroundColor:
                MaterialStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}

class AlertBox2 extends StatelessWidget {

  AlertBox2({required this.id});

  String id;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text("Want To make a personal Chat Room ?"),
      content: TextField(
        onChanged: (value){
          name = value;
        },
        decoration: InputDecoration(hintText: "Chat name"),
      ),
      actions: [
        TextButton(onPressed: ()async{
          await func.makeRoom(id, name);
          Navigator.pop(context);
        }, child:Text("YES")),
        TextButton(onPressed: (){Navigator.pop(context);}, child:Text("NO"))
      ],
    );
  }
}
