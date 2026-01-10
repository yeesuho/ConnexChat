// class Conversation {
//   String check;
//   String? profile;
//   String? name;
//   String time;
//   String talk;
//
//   Conversation(
//       this.check,
//       this.profile,
//       this.name,
//       this.time,
//       this.talk,
//       );
//
//   factory Conversation.fromJson(json) {
//     return Conversation(
//       json['대화 말풍선 구분'],
//       json['사원 프로필'],
//       json['사원 이름'],
//       json['대화 전송 시간'],
//       json['대화 내용'],
//     );
//   }
// }



class Conversation {
  int id;
  int senderId;
  String? senderName;
  String? senderProfile;
  String content;
  String timestamp;
  bool isMyMessage;

  Conversation(
      this.id,
      this.senderId,
      this.senderName,
      this.senderProfile,
      this.content,
      this.timestamp,
      this.isMyMessage,
      );


  factory Conversation.fromJson(json) {
    return Conversation(
      json['id'],
      json['senderId'],
      json['senderName'] ?? null,
      json['senderProfile'] ?? null,
      json['content'],
      json['timestamp'],
      json['isMyMessage'],
    );
  }
}
