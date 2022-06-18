import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DogHead extends StatelessWidget {
  const DogHead(
      {Key? key, required this.purl, required this.dname, required this.dtime})
      : super(key: key);
  final String purl;
  final String dname;
  final String dtime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: CachedNetworkImage(
              imageUrl: purl,
              progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Image.asset("assets/404.png"),
              fit: BoxFit.cover,
              width: 64,
              height: 64,
            ),
          ),
          Positioned(
            top: 10,
            left: 90,
            child: SelectableText(
              dname,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(204, 33, 108, 247),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              top: 40,
              left: 90,
              height: 20,
              child: SelectableText(
                dtime,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(204, 94, 228, 238),
                ),
              ))
        ],
      ),
    );
  }
}