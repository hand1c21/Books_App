import 'package:books_app/screen/introScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Modle/modle.dart';

class RegisterScreen extends StatefulWidget{
   final VoidCallback toggleThem;
  final bool isDarkMode;

  RegisterScreen({required this.isDarkMode, required this.toggleThem});

  _RegisterScreenState createState()=>_RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen>{
  final TextEditingController userNameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final FirebaseAuth _auth=FirebaseAuth.instance;

  void _register()async{
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)=>introScreen(
              isDarkMode: widget. isDarkMode, 
              toggleThem: widget. toggleThem
              ),
          ),
        );

    }catch(e){
      print("registration failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed'))
      );
    }
  }


 Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
       title: Text("Register"),
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
             _buildTextField(userNameController, "User Name"),
             SizedBox(height: 10,),
              _buildTextField(emailController, "email"),
             SizedBox(height: 10,),
              _buildTextField(passwordController,"Password",obscureText: true),
             SizedBox(height: 20,),
             ElevatedButton(
               onPressed: _register,
                child: Text("Register"))
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