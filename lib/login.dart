import 'package:car_rental_app/item1.dart';
import 'package:car_rental_app/item2.dart';
import 'package:car_rental_app/main.dart';
import 'package:car_rental_app/signup.dart';
import 'package:flutter/material.dart';

class LoginScrean extends StatelessWidget {
  const LoginScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
       body: Column(
         children: <Widget> [
           Container(
             width: double.infinity,
             height: MediaQuery.of(context).size.height / 3,
             child: Image.asset("assets/images/whitedesign.jpg"),
           ),
           Expanded(
               child: Container(
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: const BorderRadius.only(
                     topLeft: Radius.circular(30),
                     topRight: Radius.circular(30),
                   ),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        Text(
                         "Email",
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       const SizedBox(height: 10),
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                           color: Colors.black,
                         ),
                         child: const TextField(
                           style: TextStyle(
                             color: Colors.white
                           ),
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             prefixIcon: Icon(
                               Icons.email,
                               color: Colors.white,
                             ),
                             hintText: "Email",
                             hintStyle: TextStyle(color: Colors.white),
                           ),
                         ),
                       ),
                       SizedBox(
                         height: 15,
                       ),
                       Text(
                         "Password",
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       const SizedBox(height: 10),
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                           color: Colors.black,
                         ),
                         child: const TextField(
                           style: TextStyle(
                             color: Colors.white
                           ),
                           obscureText: true,
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             prefixIcon: Icon(
                               Icons.lock,
                               color: Colors.white,
                             ),
                             hintText: "Password",
                             hintStyle: TextStyle(color: Colors.white),
                           ),
                         ),
                       ),
                       SizedBox(height: 35),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(
                               context, MaterialPageRoute(builder: (context) => ItemOne())
                           );
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30),
                             color: Colors.black,
                           ),
                           child: Center(
                             child: Padding(
                               padding:  EdgeInsets.all(8.0),
                               child: const Text(
                                 "Login", style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 30,
                                 fontWeight: FontWeight.w500,
                               ),
                               ),
                             ),
                           ),
                         ),
                       ),
                       SizedBox(height: 35,),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(
                               context, MaterialPageRoute(builder: (context) => SignupScreen())
                           );
                         },
                         child: Center(
                           child: Text(
                               '- Or Sign Up -',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                           ),
                         ),
                       ),

                     ],
                   ),
                 ),
               ),

           ),

         ],
       ),
    );
  }
}
