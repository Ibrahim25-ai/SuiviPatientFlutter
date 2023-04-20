
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(),
      width: 300,
      height: 120,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.purple,
        ),
        child: Row( 
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Task Ttile",
                  style :GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  ), 

                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time_rounded,
                      color: Colors.grey[200],
                      size : 18,),
                      const SizedBox(width: 4,),
                      Text("12-12 AM Time",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 13,color: Colors.grey[100]),

                        )),
                    ],
                      ),
                      const SizedBox(height: 12,),
                      Text("Task Note",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 15,color: Colors.grey[100]),

                        )),
                    ],)
      )],))
        
        
    
    );
  }
}