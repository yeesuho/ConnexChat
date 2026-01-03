class UnreadChat {
  String room_name;
  String last_chat;
  UnreadChat(
      this.room_name,
      this.last_chat,
      );

  factory UnreadChat.fromJson(json) {
    return UnreadChat(
      json['채팅방 이름'],
      json['마지막 대화 내용'],
    );
  }

}