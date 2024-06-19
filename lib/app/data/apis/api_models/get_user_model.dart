class UserModel {
  String? status;
  String? message;
  Result? result;

  UserModel({this.status, this.message, this.result});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
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

class Result {
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
  String? gender;
  String? dob;
  String? onlineStatus;

  Result(
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
      this.gender,
      this.dob,
      this.onlineStatus});

  Result.fromJson(Map<String, dynamic> json) {
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
    gender = json['gender'];
    dob = json['dob'];
    onlineStatus = json['online_status'];
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
    data['gender'] = gender;
    data['dob'] = dob;
    data['online_status'] = onlineStatus;
    return data;
  }
}
