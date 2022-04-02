import 'package:cupidknot/View/forgotpasscord_signup.dart';
import 'package:cupidknot/View/profilescreen.dart';
import 'package:cupidknot/View/registraion.dart';
import 'package:cupidknot/View/signup_screen.dart';
import 'package:cupidknot/utils/Widgets/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool isLoading = false;
  TextEditingController _mobilecontroller = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;

  final _formKey = GlobalKey<FormState>();
  String? mobilenumber;

  buildEmail() {
    return Column(
      key: _formKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter the Mobile Number",
          style:TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 2, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextFormField(
            controller: _mobilecontroller,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            style: TextStyle(
              color: Colors.black54,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                counterText: "",
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Colors.red,
                ),
                hintText: "Mobile Number",
                hintStyle: TextStyle(
                  color: Colors.black54,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter the mobile number';
              }
              return null;
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow.shade200,
          elevation: 0,
          title: Text(
            "Login",
          )),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.yellow.shade200,
          Colors.yellow.shade50,
        ])),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(),
            ),
            Expanded(
              flex: 20,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 18,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 35),
                      ClipOval(
                        child: Image.asset(
                          "assets/cupidknot.jpg",
                          height: 130,
                        ),
                      ),
                      SizedBox(height: 35),
                      buildEmail(),
                      SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      forgotpasscord_signup()));
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Forgot ",
                                    style:TextStyle(
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(
                                  text: "Passcode?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 175,
                      ),
                      PSButton(
                          text: "Submit",
                          onPressed: () {
                            if (_mobilecontroller.text.toString().isNotEmpty &&
                                _mobilecontroller.text.length == 10) {
                              mobilenumber = _mobilecontroller.text.toString();

                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ProfileScreen(),
                                ),
                              );
                              print('mobile no>>>>>>>>>>>$mobilenumber');
                            }
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => registration()));
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Don't have an account",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
