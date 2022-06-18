import 'package:flutter/material.dart';

// import 'package:markdown_widget/markdown_widget.dart';
import 'doghead.dart';
import 'markdownpage.dart';
import '../model/doglist.dart';
import "../tool/dogtime.dart";
import '../tool/network.dart';

class WebInfo extends StatefulWidget {
  const WebInfo({Key? key}) : super(key: key);

  @override
  _WebInfoState createState() => _WebInfoState();
}

class _WebInfoState extends State<WebInfo> {
  // String resdog = "loading";
  List<ResCont> resConts = [];
  int maxItem = 0;
  int numdog = 0;
  int maxPage = 1;
  int page = 1;
  int nowItem = 0;

  @override
  void initState() {
    super.initState();
    _getDog();
  }

  void _getDog() async {
    // print("get dog");

    // Response response;
    // response = await dio.get("https://apid.dogcraft.top/api/talk/$page",
    //     options: options);
    // print(response.data.toString());
    // resdog = response.data.toString();
    // Doglist doglistl = Doglist.fromJson(response.data);
    Doglist doglistl = await getlist(page);

    setState(() {
      numdog = doglistl.sunNumber;
      final resContsl = doglistl.resCont;
      maxItem = numdog;
      maxPage = numdog ~/ 10 + 1;
      // final int clth = resConts.length;
      resConts.addAll(resContsl!);
      // resdog = response.data.toString();
      nowItem = resConts.length;
      if (nowItem == maxItem) {
        nowItem = maxItem + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [SelectableText("dog"),Expanded(flex: 1,child: )],
    // );

    return ListView.separated(
        padding: const EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => const Divider(height: .0),
        itemCount: nowItem,
        shrinkWrap: true,
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == page * 10 - 1) {
            if (nowItem < maxItem) {
              page++;
              _getDog();
              return Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                // alignment: Alignment.center,
                child: const SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            }
          }
          if (index >= maxItem) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "我是有底线的",
                style: TextStyle(color: Colors.grey),
              ),
            );
          } else {
            return Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: [
                    DogHead(
                        purl: resConts[index].avatar!,
                        dname: resConts[index].name!,
                        dtime: dogtime(resConts[index].time!)),
                    MarkdownPage(data: resConts[index].content!),
                    SelectableText(
                      resConts[index].ua!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ));
          }
          // return MarkdownWidget(data: resConts[index].content!);
          // return MarkdownPage(data: resConts[index].content!);
        });
  }
}
