import 'package:database/model/member_model.dart';
import 'package:database/pages/details_page.dart';
import 'package:database/service/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _callDetailsPage(){
    Navigator.push(context, MaterialPageRoute(builder:(context) => DetailsPage()));
  }
  _saveMember(){
    Member member = Member(2006, "Xurshidbek");
    HiveService.storeMember(member);
  }

  _saveMembers(){
    Member member1 = Member(1, "Xurshdibek");
    Member member2 = Member(2,"Sarvar");
    HiveService.saveMember(member1);
    HiveService.saveMember(member2);
  }
  _loadMembers(){
    var members = HiveService.getAllMembers();
    print(members.length.toString());
  }



  _loadMember(){
    var member = HiveService.loadMember();
    print(member.username);
  }

  @override
  void initState() {
    super.initState();
    //_loadMembers();
  }
  @override
  Widget build(BuildContext context) {

    var box = Hive.box("my_nosql");
    List<dynamic> textList = box.get("textList",defaultValue: []) ?? [];


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: textList.length,
          itemBuilder: (context,index){

            var item = textList[index];
            return ListTile(
              title: Text("-ID: ${item["text1"]}",style: TextStyle(
                fontSize: 20,
                color: Colors.black,

              ),),
              subtitle: Text("userName: ${item["text2"]}",style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),),


            );

          }
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 15,bottom: 15),
        child: FloatingActionButton(
          onPressed: (){
            _callDetailsPage();
          },
          backgroundColor: Colors.lightBlue,
          child: Icon(Icons.add,
          color: Colors.white,
          ),
        ),
      ),
    );
  }
}
