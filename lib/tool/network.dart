import 'package:dio/dio.dart';
import 'dart:io';
import '../model/doglist.dart';
import '../model/resdog.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';

Dio dio = Dio()..httpClientAdapter = Http2Adapter(
  ConnectionManager(
    idleTimeout: 10000,
  ));
Options options = Options(
    headers: {HttpHeaders.userAgentHeader: "dogapp Dart/2.17 (dart:io) "});

Future<Doglist> getlist(int page) async {
  Response response;
  response = await dio.get("https://apid.dogcraft.top/api/talk/$page",
      options: options);
  Doglist doglistl = Doglist.fromJson(response.data);
  return doglistl;
}

Future<bool> checkdogtoken(String dyk) async {
  Response response;
  Map<String, String> tkdata = {"key": dyk};
  FormData fmd = FormData.fromMap(tkdata);
  response = await dio.post("https://apid.dogcraft.top/api/key",
      options: options, data: fmd);
  String res = response.data.toString();
  if (res == "OK") {
    return true;
  } else {
    return false;
  }
}

Future<ResDog> postdoginfo({String? key,String? avatar,String? name,String? c}) async {
  String timedog = DateTime.now().millisecondsSinceEpoch.toString();
  Map<String, String?> tkdata = {"key": key, "avatar": avatar, "name": name, "content": c, "time": timedog,"ua":"dart/2.17 (dart:io) DTS APP 1.0"};
  FormData fmd = FormData.fromMap(tkdata);
  Response resp = await dio.post("https://apid.dogcraft.top/api/talk",
      options: options, data: fmd);
  ResDog resdog = ResDog.fromJson(resp.data);
  return resdog;
}


