
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppLargeText({Key? key,
  required this.text,
  this.color  = Colors.black,
  required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        
        color:color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
  
    textStyle: const TextStyle(
      
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    )
  );
}
TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    )
  );
}
TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    )
  );
}
TextStyle get subtitleStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    )
  );
}