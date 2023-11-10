
import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String fac = "";
String stu = "";

bool isfac = false;
String userId ="";
String mmm = "";

Functions func = Functions();

class Functions {

  Future<bool> signin(String email,String password)async{


      
    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/users/login"),
      body: jsonEncode({
        "email" : email,
        "password" : password
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var data = jsonDecode(response.body);

    if(data["isFaculty"]){
      fac = data["token"];
      isfac = true;
    }
    else {
      stu = data["token"];
      isfac = false;
    }

    userId = data["user"]["_id"];

      print(response.statusCode);
      //print(response.body);
      // profile["user"] = jsonDecode(response.body)["user"];
      // profile["email"] =jsonDecode(response.body)["email"];
      print(stu);
      print(fac);

      if(response.statusCode==200)return true;
      else return false;
    
  }

  Future<bool> signupStudent(String email,String password,String name,String degree, String branch, String currsem,String yearofgrad,String resume,String institute,String number,List<Map<String,String>>skills)async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/users/signup/student"),
      body: jsonEncode({
        "email" : email,
        "password" : password,
        "degree" : degree,
        "branch" : branch,
        "yearOfGrad" : yearofgrad,
        "contactNo" : number,
        "name" : name,
        "resume" : resume,
        "institute":institute,
        "abilities":skills,
        "currentSem" : currsem
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var data = jsonDecode(response.body);

    if(data["isFaculty"]){
      fac = data["token"];
      isfac = true;
    }
    else {
      stu = data["token"];
      isfac = false;
    }

    userId = data["user"]["_id"];

    print(response.statusCode);
    print(response.body);
    // profile["user"] = jsonDecode(response.body)["user"];
    // profile["email"] =jsonDecode(response.body)["email"];
    print(stu);
    print(fac);

    if(response.statusCode==200)return true;
    else return false;

  }

  Future<bool> signupFaculty(String email,String password,String name,String desc,String site,String number,List<Map<String,String>>qualifications)async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/users/signup/faculty"),
      body: jsonEncode({
        "email" : email,
        "password" : password,
        "contactNo" : number,
        "name" : name,
        "siteLink" : site,
        "qualifications" : qualifications,
        "description" : desc
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var data = jsonDecode(response.body);

    if(data["isFaculty"]){
      fac = data["token"];
      isfac = true;
    }
    else {
      stu = data["token"];
      isfac = false;
    }

    userId = data["user"]["_id"];

    print(response.statusCode);
    print(response.body);
    // profile["user"] = jsonDecode(response.body)["user"];
    // profile["email"] =jsonDecode(response.body)["email"];
    print(stu);
    print(fac);

    if(response.statusCode==200)return true;
    else return false;

  }

  Future logout()async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/users/logout"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': (isfac) ? 'Bearer $fac' : 'Bearer $stu',
      },
    );

    print(response.body);

  }

  Future<Map<String,dynamic>> getUserprofile(String id)async{


    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/studentProfile/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': (isfac) ? 'Bearer $fac' : 'Bearer $stu',
      },
    );
    print(response.statusCode);
    Map<String,dynamic>profile={};
    var data = jsonDecode(response.body);
    //print(data);
    profile["user"] = data["student"];
    profile["email"] =data["email"];
    //print(mp["internships"]);
    //print(mp["faculty"]);

    return profile;

  }

  Future<Map<String,dynamic>> getFacultyprofile()async{


    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/users/profile"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': (isfac) ? 'Bearer $fac' : 'Bearer $stu',
      },
    );
    print(response.statusCode);
    Map<String,dynamic>profile={};
    var data = jsonDecode(response.body);
    //print(data);
    profile["user"] = data["user"];
    profile["email"] =data["email"];
    //print(mp["internships"]);
    //print(mp["faculty"]);

    return profile;

  }
  
  Future<Map<String,dynamic>> getAllintern()async{


    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/internships/getAll"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $stu',
      },
    );
    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    mp["internships"] = data["internships"];
    mp["faculty"] = data["faculties"];

    //print(mp["internships"]);
    //print(mp["faculty"]);

    return mp;

  }

  Future<Map<String,dynamic>> getinterndata(String id)async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/internships/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': (isfac) ? 'Bearer $fac' : 'Bearer $stu',
      },
    );
    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    mp["internships"] = data["internship"];
    mp["faculty"] = data["faculty"];

    //print(mp["internships"]);
    //print(mp["faculty"]);
    return mp;

  }

  Future<Map<String,dynamic>> getmyinterns()async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/students/internships"),
      headers: <String, String>{
        'Authorization': 'Bearer $stu',
      },
    );

    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    mp["student"] = data["studentInternships"];
    mp["internships"] = data["internships"];
    mp["faculty"] = data["faculties"];

    //print(mp["internships"]);
    //print(mp["internships"]);
    return mp;

  }

  Future<Map<String,dynamic>> getAllFaculty()async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/allFaculties"),
      headers: <String, String>{
        'Authorization': (isfac) ? 'Bearer $fac' : 'Bearer $stu',
      },
    );
    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    mp["faculty"] = data;

    //print(mp["internships"]);
    //print(mp["faculty"]);

    return mp;

  }

  Future<Map<String,dynamic>> getAllFacultyInterns(String id)async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/faculties/allInternships/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': (isfac) ? 'Bearer $fac' : 'Bearer $stu',
      },
    );
    print(response.statusCode);
    //print(response.body);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    mp["internships"] = data["internships"];
    mp["opened"] = data["internshipsOpened"];

    //print(mp["internships"]);
    //print(mp["faculty"]);

    return mp;

  }

  Future<Map<String,dynamic>> getFaculty(String id)async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/facultyProfile/$id"),
      headers: <String, String>{
        'Authorization': 'Bearer $stu',
      },
    );

    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    mp["faculty"] = data["faculty"];
    mp["email"] = data["email"];

    //print(mp["internships"]);
    //print(mp["faculty"]);
    return mp;

  }

  Future<Map<String,dynamic>> getAllFacultyInternsHome()async{


    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/faculty/internships"),
      headers: <String, String>{
        'Authorization': 'Bearer $fac',
      },
    );

    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    // mp["faculty"] = data["faculty"];
    // mp["email"] = data["email"];
    mp["internships"] = data;
    //print(mp["internships"]);
    return mp;

  }

  Future<Map<String,dynamic>> appliedStudents(String id)async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/faculty/internship/$id"),
      headers: <String, String>{
        'Authorization': 'Bearer $fac',
      },
    );

    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    // mp["faculty"] = data["faculty"];
    // mp["email"] = data["email"];
    mp["students"] = data["students"];
    mp["profiles"] = data["profiles"];
    //print(mp["internships"]);
    return mp;

  }

  Future<bool> addInternship(String name,String start,String end,String course,String vacancies,List<Map<String,String>>exp,String cg,List<Map<String,String>>skills,String mode, String stipend)async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/faculty/addInternship"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':'Bearer $fac',
      },
      body: jsonEncode({
        "name" : name,
        "startDate" : start,
        "endDate" : end,
        "course" : course,
        "vacancies" : vacancies,
        "expectations" : exp,
        "mode" : mode,
        "stipend" : stipend,
        "requirements" : {
          "cg" : cg,
          "skills" : skills
        }
      })
    );

    print(response.body);
    if(response.statusCode == 200)return true;
    else return false;

  }

  Future<Map<String,dynamic>> getAllChatsFaculty()async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/faculty/getChats"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $fac',
      },
    );

    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    // mp["faculty"] = data["faculty"];
    // mp["email"] = data["email"];
    mp["chats"] = data;
    //print(mp["internships"]);
    return mp;

  }

  Future<Map<String,dynamic>> getChatbyId(String id)async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/chats/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': (isfac) ? 'Bearer $fac' : 'Bearer $stu',
      },
    );

    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    // mp["faculty"] = data["faculty"];
    // mp["email"] = data["email"];
    mp["msgs"] = data["messages"];
    print(mp["msgs"]);
    return mp;

  }

  Future addChatmsg(String id,String msg)async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/chats/sendMessage/$id"),
      body: jsonEncode({
        "message" : msg
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': (isfac) ? 'Bearer $fac' : 'Bearer $stu',
      },
    );

    print(response.statusCode);
    var data = jsonDecode(response.body);
    print(data);
    // mp["faculty"] = data["faculty"];
    // mp["email"] = data["email"];

  }

  Future<Map<String,dynamic>> getAllChatsStudent()async{

    http.Response response = await http.get(Uri.parse("https://aracquine-sft.herokuapp.com/students/getChats"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $stu',
      },
    );

    print(response.statusCode);
    Map<String,dynamic>mp={};
    var data = jsonDecode(response.body);
    //print(data);
    // mp["faculty"] = data["faculty"];
    // mp["email"] = data["email"];
    mp["chats"] = data;
    //print(mp["internships"]);
    return mp;

  }

  Future<int> applyForIntern(String id)async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/students/apply"),
      body: jsonEncode({
        "id" : id
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $stu',
      },
    );
    print(response.statusCode);
    print(response.body);
    mmm = response.body;
    return response.statusCode;

  }

  Future<int> actionForIntern(String stu_id,String intern_id,String status)async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/faculty/action"),
      body: jsonEncode({
        "student" : stu_id,
        "internship" : intern_id,
        "status" : status,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $fac',
      },
    );
    print(response.statusCode);
    print(response.body);
    return response.statusCode;

  }

  Future<int> updateInternship(String id)async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/internships/edit/$id"),
      body: jsonEncode({
        "isAvailable" : false,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $fac',
      },
    );
    print(response.statusCode);
    print(response.body);
    return response.statusCode;

  }

  Future makeRoom(String id,String name)async{

    http.Response response = await http.post(Uri.parse("https://aracquine-sft.herokuapp.com/faculty/makeRoom"),
      body: jsonEncode({
        "chatName" : name,
        "stud_id" : id
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $fac',
      },
    );

    print(response.statusCode);
    var data = jsonDecode(response.body);
    print(data);
    // mp["faculty"] = data["faculty"];
    // mp["email"] = data["email"];

  }







}