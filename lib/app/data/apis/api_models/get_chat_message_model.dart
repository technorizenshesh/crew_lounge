class GetChatModel {
  List<GetChatResult>? result;
  String? message;
  int? status;

  GetChatModel({this.result, this.message, this.status});

  GetChatModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetChatResult>[];
      json['result'].forEach((v) {
        result!.add(GetChatResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetChatResult {
  String? id;
  String? senderId;
  String? receiverId;
  String? chatMessage;
  String? chatImage;
  String? chatAudio;
  String? chatVideo;
  String? chatDocument;
  String? lat;
  String? lon;
  String? name;
  String? contact;
  String? clearChat;
  String? status;
  String? date;
  SenderDetail? senderDetail;
  SenderDetail? receiverDetail;
  String? timeAgo;

  GetChatResult(
      {this.id,
      this.senderId,
      this.receiverId,
      this.chatMessage,
      this.chatImage,
      this.chatAudio,
      this.chatVideo,
      this.chatDocument,
      this.lat,
      this.lon,
      this.name,
      this.contact,
      this.clearChat,
      this.status,
      this.date,
      this.senderDetail,
      this.receiverDetail,
      this.timeAgo});

  GetChatResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    chatMessage = json['chat_message'];
    chatImage = json['chat_image'];
    chatAudio = json['chat_audio'];
    chatVideo = json['chat_video'];
    chatDocument = json['chat_document'];
    lat = json['lat'];
    lon = json['lon'];
    name = json['name'];
    contact = json['contact'];
    clearChat = json['clear_chat'];
    status = json['status'];
    date = json['date'];
    senderDetail = json['sender_detail'] != null
        ? SenderDetail.fromJson(json['sender_detail'])
        : null;
    receiverDetail = json['receiver_detail'] != null
        ? SenderDetail.fromJson(json['receiver_detail'])
        : null;
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['chat_message'] = chatMessage;
    data['chat_image'] = chatImage;
    data['chat_audio'] = chatAudio;
    data['chat_video'] = chatVideo;
    data['chat_document'] = chatDocument;
    data['lat'] = lat;
    data['lon'] = lon;
    data['name'] = name;
    data['contact'] = contact;
    data['clear_chat'] = clearChat;
    data['status'] = status;
    data['date'] = date;
    if (senderDetail != null) {
      data['sender_detail'] = senderDetail!.toJson();
    }
    if (receiverDetail != null) {
      data['receiver_detail'] = receiverDetail!.toJson();
    }
    data['time_ago'] = timeAgo;
    return data;
  }
}

class SenderDetail {
  String? id;
  String? userName;
  String? image;

  SenderDetail({this.id, this.userName, this.image});

  SenderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['image'] = image;
    return data;
  }
}
