class ContactUsModel {
  String? status;
  String? message;
  ContactUsResult? result;

  ContactUsModel({this.status, this.message, this.result});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? ContactUsResult.fromJson(json['result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class ContactUsResult {
  String? id;
  String? userId;
  String? name;
  String? email;
  String? message;
  String? createdAt;
  String? updatedAt;

  ContactUsResult(
      {this.id,
      this.userId,
      this.name,
      this.email,
      this.message,
      this.createdAt,
      this.updatedAt});

  ContactUsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
