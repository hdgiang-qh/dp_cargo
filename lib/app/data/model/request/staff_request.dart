
class CreateStaffRequest {
  String? email;
  String? password;
  String? type;
  String? phone;
  String? fullname;
  String? confirmPassword;
  String? avatarUrl;

  CreateStaffRequest({
    this.email,
    this.password,
    this.type,
    this.phone,
    this.fullname,
    this.confirmPassword,
    this.avatarUrl,
  });
  CreateStaffRequest.fromJson(Map<String, dynamic> json) {
    email = json['email']?.toString();
    password = json['password']?.toString();
    type = json['type']?.toString();
    phone = json['phone']?.toString();
    fullname = json['fullname']?.toString();
    confirmPassword = json['confirm_password']?.toString();
    avatarUrl = json['avatar_url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    data['phone'] = phone;
    data['fullname'] = fullname;
    data['confirm_password'] = confirmPassword;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}
