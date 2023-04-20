import 'package:doctor_test/styles/AppLargeText_bloc.dart';
import 'package:doctor_test/screens/profilePage/Reminder/Button.dart';
import 'package:doctor_test/screens/profilePage/Reminder/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime  _selectedDate = DateTime.now();
  String _endTime = "9:30PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      padding: const EdgeInsets.only(left: 20,right: 30,top: 100),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Task",
              style: HeadingStyle,

            ),
            MyInputField(title: "Title", hint : "Enter your title",controller: _titleController,),
            MyInputField(title: "Title", hint : "Enter your Form",controller: _noteController,),
            MyInputField(title: "Date", hint :DateFormat.yMd().format(_selectedDate),
            widget : IconButton(
              icon : const Icon(Icons.calendar_today_outlined),
                color: Colors.grey,
              onPressed : (){
                print("Hi");
                _getDateFromUser();
              }
            ),
            ),
            Row(
              children: [
                Expanded(child: MyInputField(title: "Start Date", hint: _startTime,widget: IconButton( onPressed: (){
                  _getTimeFromUser(isStarTime:true);
                },icon: const Icon(Icons.access_time_rounded,color: Colors.grey)
                ,)
                ,)
                ,),
                const SizedBox(width: 12,),
                Expanded(child: MyInputField(title: "End Date", hint: _endTime,widget: IconButton( onPressed: (){
                  _getTimeFromUser(isStarTime: false);
                },icon: const Icon(Icons.access_time_rounded,color: Colors.grey)
                ,)
                ,)
                ,)
             
              ],
            ),
            MyInputField(title: "Remind", hint: "$_selectedRemind minutes early !",
            widget: DropdownButton(
              icon: const Icon(Icons.keyboard_arrow_down,
              color: Colors.grey,
              ),
              iconSize:32,
              elevation:4,
              underline:Container(height: 0,),
              onChanged: (String? newValue){
                setState(() {
                  _selectedRemind = int.parse(newValue!);
                });
              },
              style: subtitleStyle,
              items: remindList.map<DropdownMenuItem<String>>((int value){
                return DropdownMenuItem<String>(
                value: value.toString(),
                child:Text(
                  value.toString()
                ));
              }).toList(),
            ),
            ),
        
            const SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(label: "Create Task", onTap: ()=>_validateDate())
              ],
                ),
      ],
        ),    
      ),
     ),
    );
  }
  _validateDate(){
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty){
        Get.back();
    }else if(_titleController.text.isEmpty|| _noteController.text.isEmpty){
      Get.snackbar("Required ","All fields are required !",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.red,
      icon: const Icon(Icons.warning_amber_rounded),
      );

    }
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015) , lastDate:  DateTime(2212));
  if (_pickerDate != null){
    setState(() {
      
    
    _selectedDate = _pickerDate;
    });
  }else{
    print("Pick a date!");
  }
  }
_getTimeFromUser({required bool isStarTime}) async {
  var pickedTime = await _showTimePicker();
  String _formatedTime = pickedTime.format(context);
  if(pickedTime==null){
    print("Time cancelled");
  }else if(isStarTime == true){
    setState(() {
      
    
   _startTime=_formatedTime;
});
  }else if(isStarTime == false){
    setState(() {
      
   
    _endTime = _formatedTime;
     });
    }
}
_showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context, initialTime: TimeOfDay(hour: int.parse(_startTime.split(":")[0]), minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
}
}