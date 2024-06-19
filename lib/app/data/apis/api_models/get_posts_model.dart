class GetPostListModel {
  String? status;
  String? message;
  List<GetPostResult>? result;

  GetPostListModel({this.status, this.message, this.result});

  GetPostListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetPostResult>[];
      json['result'].forEach((v) {
        result!.add(GetPostResult.fromJson(v));
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

class GetPostResult {
  String? id;
  String? userId;
  String? image;
  String? description;
  String? location;
  String? lat;
  String? lon;
  String? dateTime;
  String? distance;
  String? userName;
  String? userImage;
  String? onlineStatus;

  GetPostResult(
      {this.id,
      this.userId,
      this.image,
      this.description,
      this.location,
      this.lat,
      this.lon,
      this.dateTime,
      this.distance,
      this.userName,
      this.userImage,
      this.onlineStatus});

  GetPostResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    description = json['description'];
    location = json['location'];
    lat = json['lat'];
    lon = json['lon'];
    dateTime = json['date_time'];
    distance = json['distance'];
    userName = json['user_name'];
    userImage = json['user_image'];
    onlineStatus = json['online_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['description'] = description;
    data['location'] = location;
    data['lat'] = lat;
    data['lon'] = lon;
    data['date_time'] = dateTime;
    data['distance'] = distance;
    data['user_name'] = userName;
    data['user_image'] = userImage;
    data['online_status'] = onlineStatus;
    return data;
  }
}
