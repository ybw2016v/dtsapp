class ResDog {
  int res=0;
  String status="";

  ResDog({required this.res, required this.status});

  ResDog.fromJson(Map<String, dynamic> json) {
    res = json['res'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['res'] = res;
    data['status'] = status;
    return data;
  }
}
