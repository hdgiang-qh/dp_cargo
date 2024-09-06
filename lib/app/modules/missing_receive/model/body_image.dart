class BodyImage {
  String? deliveredImageUrl;

  BodyImage({this.deliveredImageUrl});

  BodyImage.fromJson(Map<String, dynamic> json) {
    deliveredImageUrl = json['deliveredImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveredImageUrl'] = deliveredImageUrl;
    return data;
  }
}
