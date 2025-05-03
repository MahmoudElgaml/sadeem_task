import 'package:hive/hive.dart';

part 'login_response_entity.g.dart';

@HiveType(typeId: 2) // Choose a unique typeId that doesn't conflict with other Hive models
class LoginResponseEntity extends HiveObject {
  @HiveField(0)
  int? id;
  
  @HiveField(1)
  String? name;
  
  @HiveField(2)
  String? email;
  
  @HiveField(3)
  String? image;
  
  LoginResponseEntity({this.name, this.email, this.image, this.id});
}
