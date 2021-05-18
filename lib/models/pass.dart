import '../repository/database_creator.dart';

class Pass {
  int id;
  int icon;
  String label;
  String login;
  String password;
  bool hasLogin;
  bool isProtected;

  Pass({this.id, this.icon, this.label, this.password, this.isProtected});

  Pass.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.icon = json[DatabaseCreator.icon];
    this.label = json[DatabaseCreator.label];
    this.login = json[DatabaseCreator.login];
    this.password = json[DatabaseCreator.password];
    this.hasLogin = json[DatabaseCreator.hasLogin] == 1;
    this.isProtected = json[DatabaseCreator.isProtected] == 1;
  }

  // Map<String, dynamic> toMap() {
  //   var map = <String, dynamic>{
  //     DatabaseCreator.id: id,
  //     'icon': icon,
  //     'label': label,
  //     'login': login,
  //     'password': password,
  //     'isProtected': isProtected
  //   };

  //   return map;
  // }

  // Pass.fromMap(Map<String, dynamic> map) {
  //   id = map['id'];
  //   icon = map['icon'];
  //   label = map['label'];
  //   login = map['login'];
  //   password = map['password'];
  //   isProtected = map['isProtected'];
  // }
}
