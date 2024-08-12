import 'package:books_app/Modle/modle.dart';
import 'package:books_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class introScreen extends StatelessWidget {
  final VoidCallback toggleThem;
  final bool isDarkMode;

  introScreen({required this.isDarkMode, required this.toggleThem});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: toggleThem,
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/10.png'),
                  fit: BoxFit.cover, // כדי להתאים את התמונה לרוחב של ה־Container
                ),
              ),
            ),
             SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Text(
                  "Welcome to the BookStore",
                  style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold,
                   color: Colors.white70,
                   height: -7,
                   shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                   ),
                  textAlign: TextAlign.center,
                  
                ),
            SizedBox(
              height: 370,
            ),
           
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                          isDarkMode: isDarkMode, toggleThem: toggleThem),
                    ));
              },
              style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white70,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.black.withOpacity(0.5),
                    elevation: 2,
                  ),
              child: Text("Go To Store",
               style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
          ],
      ),
    );
  }
}




 // Expanded(child: Image.asset('images/10.png')

//               child: GridView.builder(
//                 gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2
// ,                 crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: books.length,
//                 itemBuilder: (context,index){
//                   final book=books[index];
//                   return GridTile(
//                     child: Image.asset(book.imageURL,fit:BoxFit.cover,),
//                     footer: GridTileBar(
//                       backgroundColor: Colors.black,
            // title: Text(book.title,textAlign: TextAlign.center,),
//                     ),
//                   );
//                 },
//               )
            // ),

            // SizedBox(
            //   height: 5,
            // ),

















































// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

// import 'dart:ffi';

// import 'package:books_app/Modle/modle.dart';
// import 'package:books_app/screen/home_screen.dart';
// import 'package:flutter/material.dart';


// class introScreen extends StatefulWidget{
//   final VoidCallback toggleThem;
//     final bool isDarkMode;
    
//     introScreen({required this.isDarkMode,required this.toggleThem});

//     introScreenState createState()=>introScreenState();
// }

// class introScreenState extends State<introScreen>{
//   // bool isDarkMode=false;
  



//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: Color.fromARGB(198, 4, 62, 85),
//      body: Column(
//        children: [
//          Padding(
//            padding: EdgeInsets.only(left: 25,right: 25,bottom: 25,top: 75),
//            child: Row(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text("Book Store",
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 16,
//                  color: Colors.black,
//                ),
//                ),
//              ],
//            ),
//            ),
//            Center(
//                 child: Row(
//               children: [
//                 Padding(padding:EdgeInsets.all(100)),
//                 GestureDetector(
//                   onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder:(context)=> HomeScreen(isDarkMode:widget. isDarkMode,toggleThem: widget.toggleThem,)
//                          )
//                         );  
//                   },
//                   child: Container(
//                     width: 55,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       image: DecorationImage(
//                     image: AssetImage('./12.jpg'),
//                     ),
                    
//                     child:Text(
//                         "Go To Store",
//                         textAlign:TextAlign.center ,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
                          
//                         ),
//                     ),
                    
//                     // Icon(Icons.keyboard_arrow_left,
//                     //     size: 25, color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//              ),
             
           
           
//        ],
       
       
//      ),
     
//     );
//   }
// }