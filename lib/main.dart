import 'package:doctor_test/home_screen.dart';
import 'package:doctor_test/screens/auth/sign_in_screen.dart';
import 'package:doctor_test/screens/auth/sign_up_screen.dart';
import 'package:doctor_test/screens/profilePage/Reminder/add_task_bar.dart';
import 'package:doctor_test/screens/profilePage/doctor_detail/doctor_detail.dart';
import 'package:doctor_test/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare - Doctor Consultation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.all(defaultPadding),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: textFieldBorder,
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
        ),
      ),
      home: const WelcomeScreen(),
      routes: {
        '/home-screen/' : (context) =>  const home_screen(),
        '/signup-screen/' : (context) => SignUpScreen(),
        '/signin-screen/' : (context) => SignInScreen(),
        '/addTask-screen' : (context) => const AddTaskPage(),
        '/detail/': (context) => const SliverDoctorDetail(),
      },
       
    );
  }
}
