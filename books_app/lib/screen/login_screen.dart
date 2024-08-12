import 'package:books_app/Modle/modle.dart';
import 'package:books_app/screen/introScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'register.dart';

class LoginScreen extends StatefulWidget{
  final VoidCallback toggleThem;
  final bool isDarkMode;

  LoginScreen({required this.toggleThem,required this.isDarkMode,});

  _LoginScreenState createState()=>_LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
final TextEditingController useNameController=TextEditingController();
final TextEditingController passwordController=TextEditingController();


  Widget build (BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Login'),
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
            _buildBooksCarusel(),
             SizedBox(height: 20,),

             
           _buildTextField(useNameController, 'User Name'),
           SizedBox(height: 10,),
           _buildTextField(passwordController, ' Password',obscureText: true),
           SizedBox(height: 20,),
           ElevatedButton(
             onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context)=>introScreen(
                     isDarkMode: widget.isDarkMode,
                     toggleThem: widget.toggleThem,
                   )
                   ),
                );
             },
             child: Text('Login'),
           ),
           ElevatedButton(
             onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context)=>RegisterScreen(
                         toggleThem:widget. toggleThem,
                          isDarkMode:widget. isDarkMode,
                   ),
                 ),
               );
             },
             child: Text("Dont have an account ? Register"),
           )

         ],
       ),
      ),
    ),
  );
  }
  Widget _buildTextField(TextEditingController controller,String lableText,{bool obscureText=false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: lableText,
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(20), 
          ),
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildBooksCarusel(){
    return CarouselSlider.builder(
      itemCount: books.length,
      itemBuilder: (context,index,child){
        final book=books[index];
        return _buildBookItem(book);
      },
     options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2,
        autoPlayInterval: Duration(seconds: 3),
      ),
      );
  }

  Widget _buildBookItem(Book book){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration:BoxDecoration(
        image: DecorationImage(
          image: AssetImage(book.imageURL),
          fit: BoxFit.cover
        )
      ) ,

    );
  }
}