class UserInfoRequest {
  String? email;
  String? gender;
  String? dob;
  String? password;

  UserInfoRequest({this.email, this.gender, this.dob, this.password});

  UserInfoRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    data['password'] = password;
    return data;
  }
}
