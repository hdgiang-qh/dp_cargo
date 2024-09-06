
class VnDeliveryUnit {
  int? id;
  String? name;
  String? code;
  String? logoUrl;
  int? status;

  VnDeliveryUnit({
    this.id,
    this.name,
    this.code,
    this.logoUrl,
    this.status,
  });
  VnDeliveryUnit.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    code = json['code'];
    logoUrl = json['logoUrl'];
    status = json['status'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['logoUrl'] = logoUrl;
    data['status'] = status;  
    return data;  
  }
}
