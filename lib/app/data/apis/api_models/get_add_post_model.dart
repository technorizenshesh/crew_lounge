class AddPostModel {
  String? status;
  String? message;
  AddPostResult? result;

  AddPostModel({this.status, this.message, this.result});

  AddPostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? AddPostResult.fromJson(json['result']) : null;
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

class AddPostResult {
  String? id;
  String? userId;
  String? image;
  String? description;
  String? location;
  String? lat;
  String? lon;
  String? dateTime;

  AddPostResult(
      {this.id,
      this.userId,
      this.image,
      this.description,
      this.location,
      this.lat,
      this.lon,
      this.dateTime});

  AddPostResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    description = json['description'];
    location = json['location'];
    lat = json['lat'];
    lon = json['lon'];
    dateTime = json['date_time'];
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
    return data;
  }
}
