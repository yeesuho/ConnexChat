class Conversation {
  String check;
  String? profile;
  String? name;
  String time;
  String talk;

  Conversation(
      this.check,
      this.profile,
      this.name,
      this.time,
      this.talk,
      );

  factory Conversation.fromJson(json) {
    return Conversation(
      json['대화 말풍선 구분'],
      json['사원 프로필'],
      json['사원 이름'],
      json['대화 전송 시간'],
      json['대화 내용'],
    );
  }
}