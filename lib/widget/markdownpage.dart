import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MarkdownPage extends StatelessWidget {
  const MarkdownPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(maxWidth: 500),
      // height: 300,
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 10),
      // margin: const EdgeInsets.all(10),
      child: buildMarkdown(),
    );
  }

  Widget buildMarkdown() => MarkdownWidget(
      padding: const EdgeInsets.all(10),
      data: data,
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
  // Widget buildMarkdown() => Column(children: MarkdownGenerator(data: data).widgets!,);
}