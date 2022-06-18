import 'package:dts_app/model/resdog.dart';
import 'package:dts_app/tool/network.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../tool/doghouse.dart';
import '../model/resdog.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'chouti.dart';

class Addpage extends StatefulWidget {
  const Addpage({Key? key}) : super(key: key);

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  String mkcont = "";
  TextEditingController textcont = TextEditingController();

  @override
  void initState() {
    super.initState();
    textcont.text = Doghouse.edittext;
    mkcont = Doghouse.edittext;
  }

  @override
  void dispose() {
    Doghouse.setEditdog(textcont.text);
    textcont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Chouti(
          page: "add",
        ),
        appBar: AppBar(
          title: const Text("Post"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[inputDog(), postBotton(), mkWiew()],
        )));
  }

  Widget inputDog() {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextField(
            maxLines: 20,
            minLines: 4,
            decoration: const InputDecoration(
              labelText: "内容",
              hintText: "想说什么？",
            ),
            controller: textcont,
            keyboardType: TextInputType.multiline,
            onChanged: (String value) {
              setState(() {
                mkcont = value;
              });
            }));
  }

  Widget mkWiew() {
    if (mkcont == "") {
      return Container();
    } else {
      return MarkdownWidget(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          data: mkcont,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          styleConfig: StyleConfig(pConfig: PConfig(
            onLinkTap: (url) async {
              final Uri _url = Uri.parse(url!);
              if (!await launchUrl(_url,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $_url';
              }
            },
          ), imgBuilder: (String url, attribute) {
            return CachedNetworkImage(
              imageUrl: url,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/404.png"),
            );
          }));
    }
  }

  Widget postBotton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        ElevatedButton.icon(
            onPressed: Doghouse.ischacked ? postInfo : null,
            icon: const Icon(Icons.send),
            label: const Text("Post"))
      ]),
    );
  }

  void postInfo() async {
    if (textcont.text == "") {
      const snkb = SnackBar(content: Text("内容不能为空"));
      ScaffoldMessenger.of(context).showSnackBar(snkb);
    } else {
      ResDog res = await postdoginfo(
          key: Doghouse.dogtoken,
          c: textcont.text,
          name: Doghouse.dogname,
          avatar: Doghouse.avatarurl);
      if (res.status != "OK") {
        const snkb = SnackBar(content: Text("Error!"));
        ScaffoldMessenger.of(context).showSnackBar(snkb);
      } else {
        const snkb = SnackBar(content: Text("发送成功"));
        ScaffoldMessenger.of(context).showSnackBar(snkb);
        Doghouse.setEditdog("");
        textcont.text = "";
        setState(() {
          mkcont = "";
        });
      }
    }
  }
}
