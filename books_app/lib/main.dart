import 'package:books_app/Modle/modle.dart';
import 'package:books_app/screen/home_screen.dart';
import 'package:books_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen/introScreen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatefulWidget{
_MyappState createState()=>_MyappState();
}

class _MyappState extends State<Myapp>{
  bool isDarkMode=true;


  void toggleThem(){
    setState(() {
      isDarkMode=!isDarkMode;
    });
  }
  
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode?ThemeData.dark():ThemeData.light(),
      home: LoginScreen(
        toggleThem:toggleThem,
        isDarkMode:isDarkMode,
      ),
    );
  }

}
List<Book>cart=[];