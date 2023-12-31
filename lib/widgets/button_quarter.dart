import 'package:flutter/material.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:scoreboard/models/futsal/quarter.dart';
import 'package:scoreboard/models/badminton/quarter.dart';
import 'package:scoreboard/models/tabletennis/quarter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ButtonQuarter extends StatefulWidget {
  const ButtonQuarter({Key? key, required this.sport, required this.name})
      : super(key: key);

  final int sport;
  final String name;

  @override
  State<ButtonQuarter> createState() => _ButtonQuarterState();
}

class _ButtonQuarterState extends State<ButtonQuarter> {
  late DatabaseReference dbRef;

  String getFirebasePath = '';
  String usePath = 'Default';
  final firebasePath = const FlutterSecureStorage();

  List<bool> onClick = <bool>[
    false,
    false,
  ];

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
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            backgroundColor: onClick[0]
                ? const Color.fromARGB(255, 56, 56, 56)
                : const Color.fromARGB(255, 23, 36, 113),
            minimumSize: Size(20.w, 5.h),
            // foreground
          ),
          onPressed: () {
            if (widget.sport == 1 && !onClick[0]) {
              setState(() {
                onClick[0] = true;
              });
              context.read<QuarterBasketball>().increment();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterBasketball>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[0] = false;
                });
              });
            }
            if (widget.sport == 2 && !onClick[0]) {
              setState(() {
                onClick[0] = true;
              });
              context.read<QuarterVolleyball>().increment();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterVolleyball>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[0] = false;
                });
              });
            }
            if (widget.sport == 3 && !onClick[0]) {
              setState(() {
                onClick[0] = true;
              });
              context.read<QuarterSoccer>().increment();
              Map<String, String> alldatas = {
                'Quarter': context.read<QuarterSoccer>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[0] = false;
                });
              });
            }
            if (widget.sport == 4 && !onClick[0]) {
              setState(() {
                onClick[0] = true;
              });
              context.read<QuarterFutsal>().increment();
              Map<String, String> alldatas = {
                'Quarter': context.read<QuarterFutsal>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[0] = false;
                });
              });
            }
            if (widget.sport == 5 && !onClick[0]) {
              setState(() {
                onClick[0] = true;
              });
              context.read<QuarterBadminton>().increment();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterBadminton>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[0] = false;
                });
              });
            }
            if (widget.sport == 6 && !onClick[0]) {
              setState(() {
                onClick[0] = true;
              });
              context.read<QuarterTabletennis>().increment();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterTabletennis>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[0] = false;
                });
              });
            }
          },
          child: Text(
            '+ ${widget.name}',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            backgroundColor: onClick[1]
                ? const Color.fromARGB(255, 56, 56, 56)
                : const Color.fromARGB(255, 23, 36, 113),
            minimumSize: Size(20.w, 5.h),
            // foreground
          ),
          onPressed: () {
            if (widget.sport == 1 && !onClick[1]) {
              setState(() {
                onClick[1] = true;
              });
              context.read<QuarterBasketball>().decrement();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterBasketball>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[1] = false;
                });
              });
            }
            if (widget.sport == 2 && !onClick[1]) {
              setState(() {
                onClick[1] = true;
              });
              context.read<QuarterVolleyball>().decrement();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterVolleyball>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[1] = false;
                });
              });
            }
            if (widget.sport == 3 && !onClick[1]) {
              setState(() {
                onClick[1] = true;
              });
              context.read<QuarterSoccer>().decrement();
              Map<String, String> alldatas = {
                'Quarter': context.read<QuarterSoccer>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[1] = false;
                });
              });
            }
            if (widget.sport == 4 && !onClick[1]) {
              setState(() {
                onClick[1] = true;
              });
              context.read<QuarterFutsal>().decrement();
              Map<String, String> alldatas = {
                'Quarter': context.read<QuarterFutsal>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[1] = false;
                });
              });
            }
            if (widget.sport == 5 && !onClick[1]) {
              setState(() {
                onClick[1] = true;
              });
              context.read<QuarterBadminton>().decrement();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterBadminton>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[1] = false;
                });
              });
            }
            if (widget.sport == 6 && !onClick[1]) {
              setState(() {
                onClick[1] = true;
              });
              context.read<QuarterTabletennis>().decrement();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterTabletennis>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  onClick[1] = false;
                });
              });
            }
          },
          child: Text(
            '- ${widget.name}',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
