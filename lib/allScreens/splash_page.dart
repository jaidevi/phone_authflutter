 // ignore_for_file: unnecessary_null_comparison

 import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:phone_auth/allConstants/color_constants.dart';
import 'package:provider/provider.dart';
//import 'package:family/allConstants/color_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'landing_page.dart';

// import '../allProviders/auth_provider.dart';
// import 'home_page.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}



class _SplashPageState extends State<SplashPage> {

    // String finalPhoneNumber; 

  @override

  //  void initState(){
  //    getValidationData().whenComplete(() async{
  //      Timer(Duration(seconds: 2),
  //      () => Get.to(finalPhoneNumber == null ? LandingPage() : HomePage()));
  //    });
  //    super.initState(); 
  //  }
  //   Future.delayed(Duration(seconds: 5),(){
  //      checkSignedIn();
  //   });
  // }

//   Future getValidationData() async{
//     print("@@@@@@@@@@@@@@@@@@@");
//   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var obtainedPhoneNumber = sharedPreferences.getString('phone number');
//   print('phone number');
//   print(obtainedPhoneNumber);
//   setState((){
//     finalPhoneNumber = obtainedPhoneNumber!;
//   });
// }

  // void checkSignedIn() async{
  //   AuthProvider authProvider = context.read<AuthProvider>();
  //   bool isLoggedIn = await authProvider.isLoggedIn();
  //   if(isLoggedIn){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomePage()));
  //     return;
  //   }
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LandingPage()));
  // }
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
            SizedBox(height:20),
            Text("Connect Your Friends and Family",
            style: TextStyle(color: ColorConstants.themeColor),
            ),
            SizedBox(height:20),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: ColorConstants.themeColor),
            )
          ],
        ),
      )
    );
  }
}