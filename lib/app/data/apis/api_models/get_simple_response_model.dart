class SimpleResponseModel {
  String? status;
  String? message;
  String? result;

  SimpleResponseModel({this.status, this.message, this.result});

  SimpleResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['result'] = result;
    return data;
  }
}
