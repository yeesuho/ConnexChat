class ChatroomList {
  int id;
  String roomName;
  String lastMessage;
  String lastMessageTime;
  int unreadCount;
  List<dynamic> participants;
  bool isBookmark;

  ChatroomList(
      this.id,
      this.roomName,
      this.lastMessage,
      this.lastMessageTime,
      this.unreadCount,
      this.participants,
      this.isBookmark
      );

  factory ChatroomList.fromJson(json) {
    return ChatroomList(
        json['id'],
        json['roomName'],
        json['lastMessage'],
        json['lastMessageTime'],
        json['unreadCount'],
        json['participants'],
        json['isBookmark']
    );
  }

  void operator [](int other) {}


}