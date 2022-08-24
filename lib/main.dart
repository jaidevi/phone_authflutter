import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:family/allScreens/home_page.dart';
//import 'package:family/allScreens/login_page.dart';
//import 'package:family/todo/addtodo.dart';
//import 'package:family/todo/hometodo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phone_auth/allScreens/home_page.dart';
import 'package:phone_auth/allScreens/login_page.dart';
import 'package:phone_auth/allScreens/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:family/allProviders/chat_provider.dart';
//import 'package:family/allScreens/splash_page.dart';

import 'allConstants/app_constants.dart';

import 'allScreens/landing_page.dart';

// import 'allProviders/auth_provider.dart';
// import 'allProviders/home_provider.dart';
// import 'allProviders/setting_provider.dart';

bool isWhite = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("userID");
  if (token != null) {
    print('Token: $token');
    Get.offAll(HomePage());
  } else {
    Get.offAll(LoginWithPhone());
  }
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  MyApp({required this.prefs});

  @override
  Widget build(BuildContext context) {
     return 
    // MultiProvider(
    //   providers: [
        // ChangeNotifierProvider<AuthProvider>(
        //   create: (_) => AuthProvider(
        //     firebaseAuth: FirebaseAuth.instance,
        //     googleSignIn: GoogleSignIn(),
        //     prefs: this.prefs,
        //     firebaseFirestore: this.firebaseFirestore,
        //   ),
        // ),
        // Provider<SettingProvider>(
        //   create: (_) => SettingProvider(
        //     prefs: this.prefs,
        //     firebaseFirestore: this.firebaseFirestore,
        //     firebaseStorage: this.firebaseStorage,
        //   ),
        // ),
        // Provider<HomeProvider>(
        //   create: (_) => HomeProvider(
        //       // prefs: this.prefs,
        //       firebaseFirestore: this.firebaseFirestore
        //       // firebaseStorage:  this.firebaseStorage,
        //       ),
        // ),
        // Provider<ChatProvider>(
        //   create: (_) => ChatProvider(
        //     firebaseFirestore: this.firebaseFirestore,
        //     prefs: this.prefs,
        //     firebaseStorage: this.firebaseStorage,
        //   ),
        // ),
     // ],
     // child:
       MaterialApp(
        title: AppConstants.appTitle,
        // theme: ThemeData(
        //   primaryColor: Colors.black,
        // ),
        home: LoginWithPhone(),
        debugShowCheckedModeBanner: false,
     // ),
    );
  }
}
