// ignore_for_file: file_names

class ResponseMessage {
  int? status;
  String? message;

  ResponseMessage({this.status, this.message});

  ResponseMessage.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    return data;
  }
}
