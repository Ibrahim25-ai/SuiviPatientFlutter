
import 'package:doctor_test/screens/profilePage/HistoriquePage_state.dart';
import 'package:doctor_test/screens/profilePage/Reminder_screen.dart';
import 'package:doctor_test/screens/profilePage/Settings.dart';
import 'package:doctor_test/screens/profilePage/profilePage_state.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types

class home_screen extends StatefulWidget {
const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screen();
}

class _home_screen extends State<home_screen> {
  
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    List pages=[
    const ProfilePage(),
    const HistoriquePage(),
    const Reminder(),
    Settings(),
  ];
    return Scaffold(
      body:pages[_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
        
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Historique',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Appointment',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
