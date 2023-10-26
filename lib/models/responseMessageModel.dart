// ignore_for_file: file_names

class ResponseMessage {
  String? code;
  String? message;

  ResponseMessage({this.code, this.message});

  ResponseMessage.fromJson(Map<String, dynamic> json) {
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
