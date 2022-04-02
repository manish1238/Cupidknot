import 'dart:convert';
import 'dart:math';
import 'package:cupidknot/utils/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sms_autofill/sms_autofill.dart';





class forgotpasscord_signup extends StatefulWidget {

  @override
  forgotpasscord_signupState createState() => forgotpasscord_signupState();
}

class forgotpasscord_signupState extends State<forgotpasscord_signup> {

  bool isLoading=false;
  TextEditingController _mobilecontroller = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger ;
  final _formKey = GlobalKey<FormState>();
  String? mobilenumber;


  buildEmail() {
    return Column(
      key: _formKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mobile Number", style:TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),),
        SizedBox(height: 6),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(0, 2)
                )
              ]
          ),
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
                prefixIcon: Icon(Icons.phone_android,
                  color: Colors.red),
                hintText: "Mobile Number",
                hintStyle:TextStyle(
                  color: Colors.black54,
                )
            ),

            validator: (value) {
              if(value!.isEmpty){
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow.shade200,
          elevation: 0,
          title: Text("Forgot Password", style:TextStyle(

          ),)

      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [

              Colors.yellow.shade200,
              Colors.yellow.shade200,
            ])),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
              ),
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

                      // Image.asset(
                      //   "assests/images/signup_img.png",
                      //   height: 100,
                      // ),

                      SizedBox(height: 35),
                      buildEmail(),

                      SizedBox(height: 175,),

                      PSButton(text: "Submit", onPressed: (){})

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

  //////--------------create-sendotp-function-call----------------'''''''''''''
  void sendotp(mobile_number) async{
    //Random function-by-send otp------/////
/*    Random random=new Random();
    otp =random.nextInt(10000);*/
    Map data={'mob':mobile_number};
    print(data.toString());
    final response=await http.post(Uri.parse(
        "https://api.msg91.com/api/v5/otp?"
            "template_id=61a9bb90d09a35633548e285&"
            "mobile="+mobile_number+"&"
            "authkey=369996AhiyJZBEiNVG61a49fe6P1"
    ),
        body: data);
    print(response.body.toString());
  }

}


