import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'chouti.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Dogabout extends StatefulWidget {
  const Dogabout({Key? key}) : super(key: key);

  @override
  State<Dogabout> createState() => _DogaboutState();
}

class _DogaboutState extends State<Dogabout> {
  String aboutmarkdown = '''
# About

This is a dog about page.

~~Test markdown.~~

This is a flutter markdown widget.

下面是一张随机图片：

![pic](https://p.neko.red/r/)

![pic](https://p.neko.red/img.jpg)

下面是一个连接：

[https://www.neko.red/about/](https://www.neko.red/about/)

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面还有很多行

下面没有了

''';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Chouti(page: "about",),
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child:SingleChildScrollView(
          child:buildMarkdown()
        ),
      ),
    );
  }

  Widget buildMarkdown() => MarkdownWidget(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      data: aboutmarkdown,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      styleConfig: StyleConfig(pConfig: PConfig(onLinkTap: (url) async {
        final Uri _url = Uri.parse(url!);
        if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
          throw 'Could not launch $_url';
        }
      },
      ),
      imgBuilder: (String url,attribute){
        return CachedNetworkImage(imageUrl: url,
        progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Image.asset("assets/404.png"),
                );
      }
      
      ));
  // if (!await launchUrl(url)) throw 'Could not launch $url';

}
