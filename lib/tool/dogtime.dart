String dogtime(String dt) {
  int timedogint = int.parse(dt);
  DateTime dt1 = DateTime.fromMillisecondsSinceEpoch(timedogint);
  var date = dt1;
  String timestr =
      "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";

  DateTime dt2 = DateTime.now();
  Duration diff = dt2.difference(dt1).abs();
  String res = "";
  if (diff.inDays > 0) {
    res = res + "${diff.inDays.toString()}天前";
  } else if (diff.inHours > 0) {
    res = res + "${diff.inHours - diff.inDays * 24}小时前";
  } else if (diff.inMinutes > 0) {
    res = res + "${(diff.inMinutes - diff.inHours * 60).toString()}分钟前";
  } else if (diff.inSeconds > 0) {
    res = res + "${diff.inSeconds}秒前";
  } else {
    res = res + "刚刚";
  }
  return res + " " + timestr;
}
