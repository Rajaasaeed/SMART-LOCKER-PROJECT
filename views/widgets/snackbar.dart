// ignore_for_file: deprecated_member_use


// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnaCkBarMessage {
  void showSuccessSnackBar(
      {required String message, required BuildContext context}) {
        // Scaffold.of(context).showSnackBar(SnackBar(
        // backgroundColor: Colors.green,
        // content: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //         message,
        //         style: const TextStyle(fontSize: 16),
        //       )
        //     )));
      }
  void showErrorSnackBar(
      {required String message, required BuildContext context}) {
    // Scaffold.of(context).showSnackBar(SnackBar(
    //     backgroundColor: Colors.red,
    //     content: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text(
    //             message,
    //             style: const TextStyle(fontSize: 16),
    //           ),
    //         ),
    //         InkWell(
    //             child: const Padding(
    //               padding: EdgeInsets.all(8.0),
    //               child: Text(
    //                 "Close",
    //                 style: TextStyle(
    //                     fontSize: 16,
    //                     color: Colors.black,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //             onTap: () => Scaffold.of(context).hideCurrentSnackBar())
    //       ],
    //     )));
  }
}
