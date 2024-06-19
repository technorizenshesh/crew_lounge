class NotificationModel {
  String? status;
  String? message;
  List<NotificationResult>? result;

  NotificationModel({this.status, this.message, this.result});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <NotificationResult>[];
      json['result'].forEach((v) {
        result!.add(NotificationResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationResult {
  String? id;
  String? userId;
  String? postId;
  String? message;
  String? dateTime;
  String? userName;
  String? userImage;

  NotificationResult(
      {this.id,
      this.userId,
      this.postId,
      this.message,
      this.dateTime,
      this.userName,
      this.userImage});

  NotificationResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    message = json['message'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['post_id'] = postId;
    data['message'] = message;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    data['user_image'] = userImage;
    return data;
  }
}
