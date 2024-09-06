class CustomersServiceStaff {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? fullname;
  String? avatarUrl;

  CustomersServiceStaff(
      {this.id,
        this.username,
        this.email,
        this.phone,
        this.fullname,
        this.avatarUrl});

  CustomersServiceStaff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
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