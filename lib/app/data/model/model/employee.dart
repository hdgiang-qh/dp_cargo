class Employee {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? fullname;
  String? avatarUrl;

  Employee({this.id, this.email, this.phone, this.fullname});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id = json['username'];
    email = json['email'];
    phone = json['phone'];
    fullname = json['fullname'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['fullname'] = fullname;
    data['avatarUrl'] = avatarUrl;
    return data;
  }
}
