// import 'package:flutter/material.dart';

// import 'login_page.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({ Key? key }) : super(key: key);

//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 ElevatedButton(
//                   //colour: Colors.lightBlueAccent,
//                   // title: 'Log In',
//                   onPressed: () {
//                    // Navigator.pushNamed(context, 'LoginWithPhone');
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginWithPhone()));
//                   }, child: Text(
//                         "Sign In",
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                 ),
//                 ElevatedButton(
//                     // colour: Colors.blueAccent,
//                     // title: 'Register',
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'registration_screen');
//                     },child: Text(
//                         "Sign Up",
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                     ),
//               ]),
//         ));
//   }
// }