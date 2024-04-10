import 'package:exam_coreflutter_meetpanchal/view/homescreen/homepage.dart';
import 'package:exam_coreflutter_meetpanchal/view/slashscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(//to fix statusebar color in app;
    statusBarColor: Color(0xFF50457d),
  ));
  runApp(studentapp());//to run app
}
class studentapp extends StatelessWidget {
  const studentapp({super.key});

  @override
  Widget build(BuildContext context) {
    return studentAPP();
  }
}
class studentAPP extends StatefulWidget {
  const studentAPP({super.key});

  @override
  State<studentAPP> createState() => _studentAPPState();
}

class _studentAPPState extends State<studentAPP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      initialRoute: '/',
      routes: {
        '/':(context) => SplashScreen(),
        '/home':(context)=>HomeScreen(),
        // '/input':(context)=>inputallscreen(),
        // '/edit':(context)=>editscreen(),
      },
    );
  }
}
