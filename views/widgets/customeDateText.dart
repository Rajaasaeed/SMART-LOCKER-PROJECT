import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomeDateText extends StatefulWidget {
  final String dateTitle;
  final TextEditingController controller;
   CustomeDateText({Key? key, required this.dateTitle, required this.controller}) : super(key: key);

DateTime initDate=DateTime.now();
  @override
  State<CustomeDateText> createState() => _CustomeDateTextState();
}

class _CustomeDateTextState extends State<CustomeDateText> {
  @override
  Widget build(BuildContext context) {
    return Row(
                      children: [
                        Text(widget.dateTitle),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Material(
                            child: InkWell(
                              onTap: (){
                                showCupertinoModalPopup(context: context,
                                 builder: (BuildContext context)=>SizedBox(
                                  height: 250,
                                  child: CupertinoDatePicker(
                                    onDateTimeChanged:(DateTime newDate){
                                   setState(() {
                                     widget.controller.text=newDate.toString();
                                     widget.initDate=newDate;
                                   });
                                      } ,
                                    backgroundColor: Colors.white,
                                    initialDateTime: widget.initDate,
                                    ),
                                 ));
                              },
                              child: CupertinoTextField(
                                controller: widget.controller,
                                enabled: false,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
  }
}