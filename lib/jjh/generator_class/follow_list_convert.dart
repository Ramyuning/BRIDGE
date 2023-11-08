

class Follows {
  late int creatorId;
  late String creatorName;
  late String profileImg;
  late int followerCount;
  late bool callStatus;

  Follows(
      {required this.creatorId,
      required this.creatorName,
      required this.profileImg,
      required this.followerCount,
      required this.callStatus});

  Follows.fromJson(Map<String, dynamic> json) {
    creatorId = json['creator_id'];
    creatorName = json['creator_name'];
    profileImg = json['profile_img'];
    followerCount = json['follower_count'];
    callStatus = json['call_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creator_id'] = this.creatorId;
    data['creator_name'] = this.creatorName;
    data['profile_img'] = this.profileImg;
    data['follower_count'] = this.followerCount;
    data['call_status'] = this.callStatus;
    return data;
  }
}

