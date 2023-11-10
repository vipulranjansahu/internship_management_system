import 'package:flutter/material.dart';
import 'package:internship_management/networking.dart';

class StudentChatScreen extends StatefulWidget {

  String name;
  String id;

  StudentChatScreen({required this.id,required this.name});

  @override
  _StudentChatScreenState createState() => _StudentChatScreenState();
}

class _StudentChatScreenState extends State<StudentChatScreen> {

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  String msg="";

  Map<String,dynamic>mp={};
  var data;
  Future getData()async{
    mp=await func.getChatbyId(widget.id);
    data = mp["msgs"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF304675),
        title: Text(widget.name),
      ),
      body: Column(

        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top: 16,bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)
              ),

              child: FutureBuilder(
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: (data[index]["by"] == userId) ? Colors.blue.withOpacity(0.5) : Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sent by:- " + data[index]["byName"],style: TextStyle(fontSize: 16,color: Colors.grey),),
                                    Text(data[index]["message"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                future: getData(),
              ),

            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                onChanged: (value){
                  msg = value;
                },
                controller: fieldText,
                decoration: InputDecoration(
                  hintText: "Type text here ...",
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide:BorderSide(color:  Color(0xFF304675)) ,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: ()async{
                        await func.addChatmsg(widget.id, msg);
                        clearText();
                        setState(() {});
                      }
                  ),
                )
            ),
          ),
        ],


      ),
    );
  }
}
