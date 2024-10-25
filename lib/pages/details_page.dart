import 'package:database/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetailsPage extends StatefulWidget {

  @override
  _DetailsPageState createState() => _DetailsPageState();


  const DetailsPage({super.key});

}

class _DetailsPageState extends State<DetailsPage> {

  _callHomePage(){
    Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));
  }

   final TextEditingController textController1 = TextEditingController();
   final TextEditingController textController2 = TextEditingController();

   @override
   void dispose(){
     textController1.dispose();
     textController2.dispose();
     super.dispose();
   }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page",style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),

          //! First TextField:
          Container(
            margin: EdgeInsets.only(left: 50),
            width: 320,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.lightBlue,
                width: 2
              ),
            ),
            child: TextField(
              controller: textController1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "ID",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                border: InputBorder.none,
              ),
            ),
          ),

          SizedBox(height: 15,),

          //! Second TextField:
          Container(
            margin: EdgeInsets.only(left: 50),
            width: 320,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: Colors.lightBlue,
                  width: 2
              ),
            ),
            child: TextField(
              controller: textController2,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "userName",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                border: InputBorder.none,
              ),
            ),
          ),

          SizedBox(height: 30,),

          //! ElevatedButton:
          Container(
            margin: EdgeInsets.only(left: 50),
            width: 130,
            height: 55,
            child: ElevatedButton(
              onPressed: () async {
                var box = Hive.box("my_nosql");

                List<dynamic> textList = box.get("textList",defaultValue: []);

               textList.add({
                 "text1" : textController1.text,
                 "text2" : textController2.text,
               });
                await box.put('textList', textList);
                print("Saved Data: $textList");

                _callHomePage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent[700]
              ),
              child: Text("Save",style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
