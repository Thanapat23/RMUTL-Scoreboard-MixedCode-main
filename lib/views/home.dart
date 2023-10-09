import "package:flutter/material.dart";
import 'package:scoreboard/widgets/image_sport.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../widgets/bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseReference dbRef;
  late bool status = false;
  String getFirebasePath = '';
  String usePath = 'Default';
  final firebasePath = const FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    firebasePath.read(key: 'Path').then(
      (value) {
        setState(() {
          if (value != '') {
            getFirebasePath = value.toString();
            usePath = getFirebasePath;
            print('Show read ' + usePath);
            dbRef = FirebaseDatabase.instance.ref().child(usePath);
          } else {
            getFirebasePath = 'No data found';
            usePath = 'Default';
            dbRef = FirebaseDatabase.instance.ref().child(usePath);
          }

          Map<String, String> alldatas2 = {
            'ScoreA': '0',
            'ScoreB': '0',
            'SetA': '0',
            'SetB': '0',
            'FoulA': '0',
            'FoulB': '0',
            'Quarter': '0',
            'Time': '00:00',
            'RunStatus': '$status',
          };
          dbRef.update(alldatas2);
        });
      },
    );
  }

  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: Titlebar().appBar("H O M E"),
          // drawer: const MenuDrawer(index: 0),
          backgroundColor: MyBackgroundColor,
          body: WillPopScope(
            onWillPop: onWillPop,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const ImageSports()),
            ),
          )),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      showToastExit(context);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
