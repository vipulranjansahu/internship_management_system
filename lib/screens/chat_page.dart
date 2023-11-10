import 'package:flutter/material.dart';
import 'package:internship_management/networking.dart';
import 'package:internship_management/screens/faculty/faculty_chat_screen.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  Map<String,dynamic>mp={};
  Future getData() async {
    mp = await func.getAllChatsStudent();
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
              Text("All Chats",style: TextStyle(fontSize: 24),),
              SizedBox(
                height: 30,
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: mp["chats"].length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              child: ListTile(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FacultyChatScreen(id: mp["chats"][index]["_id"], name: mp["chats"][index]["chatName"])));
                                },
                                leading: CircleAvatar(backgroundImage: AssetImage("images/img.jpg"),),
                                title: Text(mp["chats"][index]["chatName"]),
                                subtitle: Text((mp["chats"][index]["students"].length+1).toString()+" participants"),
                                // trailing: TextButton(onPressed: (){
                                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>General_Profile_Page(id: mp["students"][index]["id"])));
                                // },child: Text("View Profile"),),
                              ),
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
