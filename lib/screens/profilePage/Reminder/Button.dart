import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const Button({Key? key,required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top : 10.0),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF4e5ae8),
        ),
      child: Text(
        
        label,
        style: const TextStyle(
          color: Colors.white,
          
         ),
         textAlign: TextAlign.center,
      ),
      ),
    );
  }
}