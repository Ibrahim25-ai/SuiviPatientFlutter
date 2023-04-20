import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_test/styles/AppLargeText_bloc.dart';
import 'package:doctor_test/screens/profilePage/Reminder/Task_tile.dart';
import 'package:doctor_test/screens/profilePage/Reminder/add_task_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'Reminder/Button.dart';


class Reminder extends StatefulWidget {
  const Reminder({Key? key,}) : super(key: key);
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> with TickerProviderStateMixin{
  DateTime _selectedDate = DateTime.now();
  var notifyHelper;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          _addTaskBar(),
          const SizedBox(height: 10,),
          _addDateBar(),
          const SizedBox(height: 10,),
          _showTasks(),
          ],
      ),
    );
}
_showTasks(){
      return Container(
                               padding: const EdgeInsets.all(15),
                                height: 500,
                                width : 1000,
                          
                                child:Column( 
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                   const TaskTile(),
                                   const SizedBox(height: 10,),
                                   const TaskTile(),
                                   const SizedBox(height: 10,),
                                   const TaskTile(),
                                   
                            ],
                                   ),
      );
  
     
}
_addDateBar(){
  return   Container(
            margin: const EdgeInsets.only(top: 20,left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width:80,
              initialSelectedDate : DateTime.now(),
              selectionColor :  const Color(0xFF4e5ae8),
              selectedTextColor : Colors.white,
              dateTextStyle : GoogleFonts.lato(
                textStyle : const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
              ),
              dayTextStyle : GoogleFonts.lato(
                textStyle : const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
              ),
              monthTextStyle : GoogleFonts.lato(
                  textStyle : const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                ),
              onDateChange:  (date){
                  _selectedDate = date;
              },        
            ),
          );
        
}
_addTaskBar(){
  return   Container(
            margin: const EdgeInsets.only(top: 60,left : 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now()),
                    style: subHeadingStyle,
                    ),
                    Text("Today",
                    style: HeadingStyle,),
                    
                  ],
                ),
                
                Button(label:"+Add Task", onTap: ()=>Get.to(() =>const AddTaskPage())),
              ],
            ),
          );
       
   }
   
}