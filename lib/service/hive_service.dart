import 'package:database/model/member_model.dart';
import 'package:hive/hive.dart';

class HiveService{
  static var box = Hive.box("my_nosql");


  //! Saving objects using key and value:
  static storeMember(Member member){
    box.put("member", member);
  }

  static Member loadMember(){
    var member = box.get("member");
    return member;
  }

  static removeMember() async{
    box.delete("member");
  }

  //! Saving objects without key:
static saveMember(Member member){
    box.add(member);
  }
  static updateMember(int index,Member member){
    box.putAt(index, member);
  }
  static List<Member> getAllMembers(){
    List<Member> members = [];

    for (int i = 0;i < box.length;i++){
      var member = box.getAt(i);
      members.add(member);
    }
    return members;
  }

  static deleteMemberByIndex(int index) async{
    box.delete(index);
  }

}