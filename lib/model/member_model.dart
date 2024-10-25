import 'package:hive/hive.dart';
part 'member_model.g.dart';
@HiveType(typeId: 0)
class Member extends HiveObject{

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String username;

  Member(this.id,this.username);

}