class Doglist {
  List<ResCont>? resCont;
  int sunNumber=0;

  Doglist({this.resCont, this.sunNumber=0});

  Doglist.fromJson(Map<String, dynamic> json) {
    if (json['ResCont'] != null) {
      resCont = <ResCont>[];
      json['ResCont'].forEach((v) {
        resCont!.add(ResCont.fromJson(v));
      });
    }
    sunNumber = json['SunNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resCont != null) {
      data['ResCont'] = resCont!.map((v) => v.toJson()).toList();
    }
    data['SunNumber'] = sunNumber;
    return data;
  }
}

class ResCont {
  String? avatar;
  String? content;
  String? name;
  String? time;
  String? ua;

  ResCont({this.avatar, this.content, this.name, this.time, this.ua});

  ResCont.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    content = json['content'];
    name = json['name'];
    time = json['time'];
    ua = json['ua'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['content'] = content;
    data['name'] = name;
    data['time'] = time;
    data['ua'] = ua;
    return data;
  }
}