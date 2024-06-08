class GetChatUserModel {
  String? status;
  String? message;
  List<GetChatUserResult>? result;

  GetChatUserModel({this.status, this.message, this.result});

  GetChatUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetChatUserResult>[];
      json['result'].forEach((v) {
        result!.add(GetChatUserResult.fromJson(v));
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

class GetChatUserResult {
  String? id;
  String? userName;
  String? email;
  String? mobile;
  String? password;
  String? image;
  String? type;
  String? dateTime;
  String? token;
  String? otp;
  String? registerId;
  String? address;
  String? lat;
  String? lon;
  String? status;
  String? countryCode;
  int? noOfMessage;
  String? lastMessage;
  String? lastImage;
  String? date;
  String? time;
  String? timeAgo;
  String? senderId;
  String? receiverId;

  GetChatUserResult(
      {this.id,
      this.userName,
      this.email,
      this.mobile,
      this.password,
      this.image,
      this.type,
      this.dateTime,
      this.token,
      this.otp,
      this.registerId,
      this.address,
      this.lat,
      this.lon,
      this.status,
      this.countryCode,
      this.noOfMessage,
      this.lastMessage,
      this.lastImage,
      this.date,
      this.time,
      this.timeAgo,
      this.senderId,
      this.receiverId});

  GetChatUserResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    image = json['image'];
    type = json['type'];
    dateTime = json['date_time'];
    token = json['token'];
    otp = json['otp'];
    registerId = json['register_id'];
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
    status = json['status'];
    countryCode = json['country_code'];
    noOfMessage = json['no_of_message'];
    lastMessage = json['last_message'];
    lastImage = json['last_image'];
    date = json['date'];
    time = json['time'];
    timeAgo = json['time_ago'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['password'] = password;
    data['image'] = image;
    data['type'] = type;
    data['date_time'] = dateTime;
    data['token'] = token;
    data['otp'] = otp;
    data['register_id'] = registerId;
    data['address'] = address;
    data['lat'] = lat;
    data['lon'] = lon;
    data['status'] = status;
    data['country_code'] = countryCode;
    data['no_of_message'] = noOfMessage;
    data['last_message'] = lastMessage;
    data['last_image'] = lastImage;
    data['date'] = date;
    data['time'] = time;
    data['time_ago'] = timeAgo;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    return data;
  }
}
