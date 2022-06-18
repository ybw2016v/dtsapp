import 'package:shared_preferences/shared_preferences.dart';

class Doghouse {
  static late SharedPreferences spf;
  static String edittext = "";
  static String dogname = "";
  static String avatarurl = "";
  static String dogtoken = "";
  static bool ischacked = false;
  static init() async {
    spf = await SharedPreferences.getInstance();
    String? editdog = spf.getString("editdog");
    if (editdog == null) {
      spf.setString("editdog", "");
      editdog = "";
    }
    edittext = editdog;
    String? dname = spf.getString("dogname");
    if (dname == null) {
      spf.setString("dogname", "");
      dname = "";
    }
    dogname = dname;
    String? davatar = spf.getString("avatarurl");
    if (davatar == null) {
      spf.setString("avatarurl", "");
      davatar = "";
    }
    avatarurl = davatar;
    String? dtoken = spf.getString("dogtoken");
    if (dtoken == null) {
      spf.setString("dogtoken", "");
      dtoken = "";
    }
    dogtoken = dtoken;

    bool? dischecked = spf.getBool("ischecked");
    if (dischecked == null) {
      spf.setBool("ischecked", false);
      dischecked = false;
    }
    ischacked = dischecked;
  }

  static void setEditdog(String value) {
    spf.setString("editdog", value);
    edittext = value;
  }
  
  static void setDogname(String value) {
    spf.setString("dogname", value);
    dogname = value;
  }

  static void setAvatarurl(String value) {
    spf.setString("avatarurl", value);
    avatarurl = value;
  }

  static void setDogtoken(String value) {
    spf.setString("dogtoken", value);
    dogtoken = value;
  }

  static void setIschacked(bool value) {
    spf.setBool("ischecked", value);
    ischacked = value;
  }

}
