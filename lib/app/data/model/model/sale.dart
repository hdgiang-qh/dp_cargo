class Sale {
  int? id;
  String? fullname;

  Sale({
    this.id,
    this.fullname,
  });

  Sale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    return data;
  }
}