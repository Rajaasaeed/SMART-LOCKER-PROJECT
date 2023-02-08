import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrevOneLocker extends StatelessWidget {
  final int lockerIndex;
  const PrevOneLocker({Key? key, required this.lockerIndex}) : super(key: key);

  void showDialog(context, txt) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Locker Info'),
            content: Text(
              txt,
              style: TextStyle(fontSize: 30),
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: Text('close'),
                onPressed: () {
                  Navigator.pop(context);
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tobPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double height = MediaQuery.of(context).size.height;

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Container(
        // alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: width * 0.15,vertical: 10),
        padding: EdgeInsets.all(5),
        height: width * 0.60,
        width: width * 0.60,
        
        color: Colors.white.withOpacity(0.4),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, crossAxisSpacing: 4, mainAxisSpacing: 4,),
            itemCount: 25,
            itemBuilder: (context1, index) {
              return Container(
                
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.black),
                    color: index == 3
                        ? Colors.red
                        : index == 12
                            ? Colors.green[300]
                            : null),

                height: width * 0.054,
                width: width * 0.054,
                child: GestureDetector(
                    onTap: () => showDialog(
                        context, 'the $lockerIndex locker and $index tab'),
                    child: Center(child: Text('$index'))),
              );
            }),
      ),
    );
  }
}
