class GetMyPostModel {
  String? status;
  String? message;
  List<GetMyPostResult>? result;

  GetMyPostModel({this.status, this.message, this.result});

  GetMyPostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetMyPostResult>[];
      json['result'].forEach((v) {
        result!.add(GetMyPostResult.fromJson(v));
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

class GetMyPostResult {
  String? id;
  String? userId;
  String? image;
  String? description;
  String? location;
  String? lat;
  String? lon;
  String? dateTime;
  String? type;
  String? distance;
  String? userName;
  String? userImage;

  GetMyPostResult(
      {this.id,
      this.userId,
      this.image,
      this.description,
      this.location,
      this.lat,
      this.lon,
      this.dateTime,
      this.type,
      this.distance,
      this.userName,
      this.userImage});

  GetMyPostResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    description = json['description'];
    location = json['location'];
    lat = json['lat'];
    lon = json['lon'];
    dateTime = json['date_time'];
    type = json['type'];
    distance = json['distance'];
    userName = json['user_name'];
    userImage = json['user_image'];
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
    data['type'] = type;
    data['distance'] = distance;
    data['user_name'] = userName;
    data['user_image'] = userImage;
    return data;
  }
}
