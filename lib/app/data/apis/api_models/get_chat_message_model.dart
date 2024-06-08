class GetChatModel {
  String? status;
  String? message;
  List<GetChatResult>? result;

  GetChatModel({this.status, this.message, this.result});

  GetChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetChatResult>[];
      json['result'].forEach((v) {
        result!.add(GetChatResult.fromJson(v));
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
  String? result;

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
      this.result});

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
    result = json['result'];
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
    data['result'] = result;
    return data;
  }
}
