class Meta {
  dynamic page;
  dynamic pageSize;
  dynamic total;
  dynamic totalPage;

  Meta({this.page, this.pageSize, this.total, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['total'] = total;
    data['totalPage'] = totalPage;
    return data;
  }
}
