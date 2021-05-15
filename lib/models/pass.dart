class Pass {
  int id;
  int icon;
  String label;
  String password;
  bool isProtected;

  Pass({this.id, this.icon, this.label, this.password, this.isProtected});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'icon': icon,
      'label': label,
      'password': password,
      'isProtected': isProtected
    };

    return map;
  }

  Pass.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    icon = map['icon'];
    label = map['label'];
    password = map['password'];
    isProtected = map['isProtected'];
  }
}
