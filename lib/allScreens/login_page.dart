//import 'package:family/allControllers/auth_controllers.dart';
//import 'package:family/allScreens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:phone_auth/allScreens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("userID");
  if (token != null) {
    print('Token: $token');
    Get.offAll(HomePage());
  } else {
    Get.offAll(LoginWithPhone());
  }
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  TextEditingController phoneController = TextEditingController(text: "+91 ");

  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    //AuthController authController = AuthController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Phone"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              autofocus: true,
              decoration: InputDecoration(labelText: "Phone number"),
              keyboardType: TextInputType.phone,
            ),
            Visibility(
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(labelText: "OTP"),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              visible: otpVisibility,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (otpVisibility) {
                    print("object111");
                    print(otpVisibility);
                    print(phoneController);
                    ///////rj
                    //   verifyOTP();
                    verifyCode1(context);
                  } else {
                    loginWithPhone();
                  }
                },
                child: Text(otpVisibility ? "Verify" : "Login")),
          ],
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
          print(phoneController);
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        print("You are logged in successfully");
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyCode1(BuildContext context) async {
    var firebaseToken;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    try {
      await auth.signInWithCredential(credential).then((value) async {
        // print("\n\n User UID should be   ${value.user!.uid}");
        print("verifyCode  :  Login successfull");
        value.user!.getIdToken().then((value) => {
              firebaseToken = value,
              print("This is the firebase token  ==  $firebaseToken"),
              // verifyOtp(
              //     mobileNo: phoneNoController.text,
              //     otp: codeController.text,
              //     ftoken: firebaseToken)
            });
        final snackBar = SnackBar(content: Text("Login Successful"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));

        // //Creting new user
        // final dataAuth = await FirebaseAuth.instance.createUserWith(
        //   phone_number: phoneController.text,
        // );

      });
    } catch (e) {
      final snackBar = SnackBar(
          content: Text(
              "The sms code has expired or you entered a wrong code. Please re-send the code to try again."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
