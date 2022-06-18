import 'package:flutter/material.dart';
import '../tool/doghouse.dart';
import 'chouti.dart';
import '../tool/network.dart';

class SetPage extends StatelessWidget {
  const SetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Chouti(
          page: "settings",
        ),
        appBar: AppBar(
          title: const Text("设置"),
        ),
        body: const SingleChildScrollView(child: SetDog()));
  }
}

class SetDog extends StatefulWidget {
  const SetDog({Key? key}) : super(key: key);

  @override
  State<SetDog> createState() => _SetDogState();
}

class _SetDogState extends State<SetDog> {
  String dogtk = "";
  String dogname = "";
  String avatarurl = "";
  bool ischecked = false;

  TextEditingController dogTokenController = TextEditingController();
  TextEditingController dogNameController = TextEditingController();
  TextEditingController dogAvatarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dogtk = Doghouse.dogtoken;
    dogname = Doghouse.dogname;
    avatarurl = Doghouse.avatarurl;
    ischecked = Doghouse.ischacked;
    dogTokenController.text = dogtk;
    dogNameController.text = dogname;
    dogAvatarController.text = avatarurl;
  }

  @override
  void dispose() {
    dogTokenController.dispose();
    dogNameController.dispose();
    dogAvatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tokenDog(),
        tokenStateDog(),
        const Divider(
          height: 10,
        ),
        dogNameInfo(),
        dogAvatarInfo(),
        saveButton()
      ],
    );
  }

  Widget tokenDog() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Token",
            hintText: "请输入Token",
            prefixIcon: Icon(Icons.key),
          ),
          controller: dogTokenController,
        ));
  }

  Widget tokenStateDog() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text("状态: "),
              ischecked
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.error, color: Colors.red)
            ]),
            ElevatedButton.icon(
                onPressed: checktoken,
                icon: const Icon(Icons.check),
                label: const Text("Check"))
          ],
        ));
  }

  Future<void> checktoken() async {
    String dyk = dogTokenController.text;
    bool res = await checkdogtoken(dyk);
    Doghouse.setIschacked(res);
    Doghouse.setDogtoken(dogTokenController.text);
    setState(() {
      ischecked = res;
      // dogtk = dogTokenController.text;
    });
  }

  Future<void> saveInfo() async {
    await checktoken();
    Doghouse.setDogname(dogNameController.text);
    Doghouse.setAvatarurl(dogAvatarController.text);
    const snkbar = SnackBar(
      content: Text("保存成功"),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snkbar);
  }

  Widget dogNameInfo() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          obscureText: false,
          decoration: const InputDecoration(
            labelText: "Name",
            hintText: "请输入Name",
            prefixIcon: Icon(Icons.person),
          ),
          controller: dogNameController,
        ));
  }

  Widget dogAvatarInfo() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          obscureText: false,
          decoration: const InputDecoration(
            labelText: "Avatar url",
            hintText: "Avatar url",
            prefixIcon: Icon(Icons.wifi),
          ),
          controller: dogAvatarController,
        ));
  }

  Widget saveButton() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        ElevatedButton.icon(
            onPressed: saveInfo,
            icon: const Icon(Icons.save),
            label: const Text("Save"))
      ]),
    );
  }
}
