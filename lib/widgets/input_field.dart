import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/theme.dart';

class MyInput extends StatelessWidget {
  final String name;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
   MyInput({Key? key,
    required this.name,
    required this.hint,
    this.controller,
    this.widget,

  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              name,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(border: Border.all(
              color: Colors.grey,
              width: 1.0
            ),
            borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children:[
                Expanded(
                child: TextFormField(
                  readOnly: widget==null?false:true,
                  autofocus: false,
                cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                controller: controller,
                style: subtitleStyle,
                decoration: InputDecoration(
                    hintText: hint,
                hintStyle: subtitleStyle,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.backgroundColor,
                      width: 0
                )
                ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0
                      )
                  ),
                ),
                ),
              ),
              Expanded(child: TextFormField(keyboardType: TextInputType.number,)),
              widget==null?Container():Container(child:widget)
              ]
            ),
          )
        ],
      ),
    );
  }
}
