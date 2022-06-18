import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../tool/doghouse.dart';

class Chouti extends StatelessWidget {
  const Chouti({Key? key, this.page = 'home'})
      : super(
          key: key,
        );
  final String page;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerHeader(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(Doghouse.dogname)),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),

                child: ClipRRect(
                   borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: CachedNetworkImage(imageUrl: Doghouse.avatarurl,
        progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Image.asset("assets/404.png"),
                ),
                ),
              ))
            ],
          ),
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
            if (page != 'home') {
              Navigator.pushNamed(context, '/home');
            }
            // Navigator.pushNamed(context, '/home');
            // Navigator.pop(context);
          },
        ),
        ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Post'),
            onTap: () {
              Navigator.pop(context);
              if (page != 'add') {
                Navigator.pushNamed(context, '/add');
              }
            }
            // Navigator.pushNamed(context, '/add');
            // Navigator.pop(context);
            ),
        ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              if (page != 'settings') {
                Navigator.pushNamed(context, '/settings');
              }
            }
            // Navigator.pushNamed(context, '/add');
            // Navigator.pop(context);
            ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () {
            Navigator.pop(context);
            if (page != 'about') {
              Navigator.pushNamed(context, '/about');
            }
            // Navigator.pushNamed(context, '/about');
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Close'),
          onTap: () {
            // Navigator.pushNamed(context, '/about');
            Navigator.pop(context);
          },
        )
      ]),
    );

    // return Container();
  }
}
