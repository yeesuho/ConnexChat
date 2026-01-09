// class UnreadChat {
//   String room_name;
//   String last_chat;
//   UnreadChat(
//       this.room_name,
//       this.last_chat,
//       );
//
//   factory UnreadChat.fromJson(json) {
//     return UnreadChat(
//       json['채팅방 이름'],
//       json['마지막 대화 내용'],
//     );
//   }
//
// }


class UnreadChat {
  final int chatroomId;
  final String roomName;
  final String lastMessage;
  final int unreadCount;
  final List<Participant> participants;

  UnreadChat(
      this.chatroomId,
      this.roomName,
      this.lastMessage,
      this.unreadCount,
      this.participants,
      );

  factory UnreadChat.fromJson(json) {
    return UnreadChat(
      json['chatroomId'],
      json['roomName'],
      json['lastMessage'],
      json['unreadCount'],
      json['participants'],
    );
  }
}

class Participant {
  final int id;
  final String name;
  final String profileImage;

  Participant(
      this.id,
      this.name,
      this.profileImage,
      );

  factory Participant.fromJson(json) {
    return Participant(
      json['id'],
      json['name'],
      json['profileImage'],
    );
  }
}