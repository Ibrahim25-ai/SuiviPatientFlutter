import 'package:doctor_test/styles/AppLargeText_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final String title;
    final String hint;
    final TextEditingController? controller;
    final Widget? widget;
    const MyInputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.only(top : 16),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: titleStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,
              width : 1.0
            ),
            borderRadius : BorderRadius.circular(12),
          ),
        child: Row(
          children:[
            Expanded(
            child: TextFormField(
              readOnly: widget==null?false:true,
              autofocus: false,
              controller: controller,
              style: subtitleStyle,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: subtitleStyle,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width : 0
                  ),
                ),
                
              ),
            ),
            ),
            widget==null?Container():Container(child:widget),
          ],
      ),
          ),
        ],
      
      ),

    );
  }
}