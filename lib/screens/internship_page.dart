
import 'package:flutter/material.dart';
import 'package:internship_management/screens/faculty/applied_students.dart';
import 'package:internship_management/networking.dart';

class InternshipScreen extends StatelessWidget {

  int faculty;
  Map<String,dynamic>data;
  InternshipScreen({required this.faculty,required this.data});


  List<Widget>skills = [];
  List<Widget>exp= [];

  @override
  Widget build(BuildContext context) {

    for(var i in data["internships"]["requirements"]["skills"]){
      skills.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        child: Row(
          children: [
            Icon(Icons.stop,size: 15,),
            Text(i["skill"],style: TextStyle(fontSize: 18),),
          ],
        ),
      ),);
    }

    for(var i in data["internships"]["expectations"]){
      exp.add(Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        child: Row(
          children: [
            Icon(Icons.stop,size: 15,),
            Text(i["expectation"],style: TextStyle(fontSize: 18),),
          ],
        ),
      ),);
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/img.jpg"),
                radius: MediaQuery.of(context).size.width/6,
              ),
              SizedBox(
                height: 10,
              ),
              Text(data["internships"]["name"],style: TextStyle(fontSize: 24),),
              Text(data["faculty"]["name"],style: TextStyle(fontSize: 20,color: Colors.grey),),
              SizedBox(height: 10,),
              (faculty==1 ? Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AppliedStudentsPage(id: data["internships"]["_id"])));
                      },
                      child: const Text("See Applicants"),
                      style: ElevatedButton.styleFrom(
                          primary:Color(0xFF304675),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //minimumSize: Size(250,42)
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async{

                        await func.updateInternship(data["internships"]["_id"]);
                        Navigator.pop(context);

                      },
                      child: const Text("Close",style: TextStyle(color: Color(0xFF304675)),),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2,color:Color(0xFF304675) ),
                          primary:Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                          //minimumSize: Size(250,42)
                      ),
                    ),
                  ),
                ),
              ],) : SizedBox()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                    color: Color(0xffDEE0E0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Course ",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("Start Date ",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("End Date ",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("Available ",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("Stipend ",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("Mode ",style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(":  ${data["internships"]["course"]}",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text(":  ${data["internships"]["startDate"].toString().substring(0,10)}",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text(":  ${data["internships"]["endDate"].toString().substring(0,10)}",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text(":  ${data["internships"]["isAvailable"]}",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text(":  ${data["internships"]["stipend"]}",style: TextStyle(fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text(":  ${data["internships"]["mode"]}",style: TextStyle(fontSize: 18),),


                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                      color: Color(0xffDEE0E0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text("Requirements :",style: TextStyle(fontSize: 20),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.stop,size: 15,),
                                  Text("Cg : ${data["internships"]["requirements"]["cg"]}",style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text("Skills :",style: TextStyle(fontSize: 20),),
                            ),
                            Column(
                              children: skills,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text("Expectations :",style: TextStyle(fontSize: 20),),
                            ),
                            Column(
                                 children: exp,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              (faculty==3 || faculty ==1 ? SizedBox() : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async{

                    int x =await func.applyForIntern(data["internships"]["_id"]);
                    if(x==200){
                       var snackbar = SnackBar(
                        backgroundColor: Colors.blueGrey,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          mmm,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                    else {
                      const snackbar = SnackBar(
                        backgroundColor: Colors.blueGrey,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "Something Went Wrong",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }

                    Navigator.pop(context);

                  },
                  child: const Text("Apply Now"),
                  style: ElevatedButton.styleFrom(
                      primary:Color(0xFF304675),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(250,42)
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
