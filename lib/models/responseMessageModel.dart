// ignore_for_file: file_names

class GetOrder {
  String? code;
  String? message;

  GetOrder({this.code, this.message});

  GetOrder.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
