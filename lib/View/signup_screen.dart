import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sms_autofill/sms_autofill.dart';

import '../utils/Widgets/button.dart';




class signuppage extends StatefulWidget {

  @override
  _signuppageState createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {

  bool isLoading=false;
  TextEditingController _mobilecontroller = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger ;
  final _formKey = GlobalKey<FormState>();
  String? mobilenumber;

  final TextEditingController _rfirstname = TextEditingController();
  final TextEditingController _remailid = TextEditingController();
  final TextEditingController _raddress = TextEditingController();
  final TextEditingController _distrt = TextEditingController();
  final TextEditingController _rpincode = TextEditingController();


  final _firstname = GlobalKey<FormState>();
  final _emailid = GlobalKey<FormState>();
  final _completeaddres = GlobalKey<FormState>();
  final _district = GlobalKey<FormState>();
  final _pincode = GlobalKey<FormState>();
  buildEmail() {
    final color1=Colors.red;
    final color=Colors.orange;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        key: _formKey,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("Mobile Number", style: GoogleFonts.kanit(
          //   color: Colors.black54,
          //   fontWeight: FontWeight.w500,
          // ),),
          SizedBox(height: 6),


          Container(
            // child: Padding(
              // padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: size.height * 0.002,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,

                      decoration: BoxDecoration(
                          // color: Colors.white.withOpacity(0.6),
                          border: Border.all(color:color),
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(0, 2))
                          ]),
                      height: 70,
                      child: Row(
                        children: [
                          SizedBox(width: size.width * 0.02),
                          Icon(
                            Icons.mobile_friendly,
                            color: color1,
                            size: 24.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text('widget.mobilenumber')
                        ],
                      )

                  ),
                  SizedBox(height: size.height * 0.02),

                  Container(
                    alignment: Alignment.centerLeft,

                    height: 70,
                    child: Form(
                      // key: _firstname,
                      child: TextFormField(
                        controller: _rfirstname,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color:color1,
                          ),
                          labelText: "User Name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                          //fillColor: Colors.green
                        ),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the name';
                          } else
                            return null;
                        },
                      ),
                    ),
                  ),








                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.centerLeft,

                    height: 70,
                    child: Form(
                      key: _emailid,
                      child: TextFormField(
                        controller: _remailid,
                        keyboardType: TextInputType.emailAddress,
                        //himaxLength: 10,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color:  color1,
                          ),
                          labelText:'Please enter the Email ID',
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                          //fillColor: Colors.green
                        ),

                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please enter the Email ID'.tr;
                        //   } else
                        //     return null;
                        // },

                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.centerLeft,

                    height: 70,
                    child: Form(
                      key: _completeaddres,
                      child: TextFormField(
                        controller: _raddress,
                        keyboardType: TextInputType.text,
                        //himaxLength: 10,
                        style: TextStyle(
                          color: Colors.black,
                        ),          decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.home,
                          color:  color1,
                        ),
                        labelText:"Address",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                        // decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     contentPadding: EdgeInsets.only(top: 14),
                        //     prefixIcon: Icon(Icons.home, color: Pallet.deeppink),
                        //     hintText: "Complete Address".tr,
                        //     hintStyle: GoogleFonts.kanit(
                        //       color: Colors.black54,
                        //     )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the Address';
                          } else
                            return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.centerLeft,

                    height: 70,
                    child: Form(
                      key: _district,
                      child: TextFormField(
                        controller: _distrt,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.black,
                        ),

                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.add_location_alt_rounded,
                            color:  color1,
                          ),
                          labelText:"District",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                          //fillColor: Colors.green
                        ),
                        // decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     contentPadding: EdgeInsets.only(top: 14),
                        //     prefixIcon: Icon(Icons.add_location_alt_rounded,
                        //         color: Colors.green),
                        //     hintText: "District".tr,
                        //     hintStyle: GoogleFonts.kanit(
                        //       color: Colors.black54,
                        //     )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the District';
                          } else
                            return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.centerLeft,

                    height: 70,
                    child: Form(
                      key: _pincode,
                      child: TextFormField(
                        controller: _rpincode,
                        keyboardType: TextInputType.phone,
                        maxLength: 9,
                        //himaxLength: 10,
                        style: TextStyle(
                          color: Colors.black,
                        ),

                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.add_location,
                            color:  color1,
                          ),
                          labelText:"Pin code",counterText: "",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                          //fillColor: Colors.green
                        ),
                        // decoration: InputDecoration(    counterText: "",
                        //     border: InputBorder.none,
                        //     contentPadding: EdgeInsets.only(top: 14),
                        //     prefixIcon: Icon(Icons.code, color: Pallet.deeppink),
                        //     hintText: "Pin code".tr,
                        //     hintStyle: GoogleFonts.kanit(
                        //       color: Colors.black54,
                        //     )),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the Pin code';
                          } else if (value.length<=3) {
                            return 'Please enter valid Pin code';
                          } else
                            return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 85,
                  ),
                  PSButton(
                      text: "Submit",
                      onPressed: () async {
                        // _isValid = EmailValidator.validate(_employeremailid.text);
                        if (_firstname.currentState!.validate()) {
                          // Navigator.pushReplacement<void,void>(context,
                          //     MaterialPageRoute<void>(builder: (context) => dashboard()));


                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     new SnackBar(
                          //         content: new Text(
                          //           "Email is invalid".tr,
                          //           style: TextStyle(color: Colors.black),
                          //         ),
                          //         backgroundColor:
                          //         Colors.green.shade200)
                          // );


                        }
                      }


                  ),
                  SizedBox(height: size.height * 0.04),
                ],
              ),

          ),
        ],
      ),
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
          title: Text("Sign up",)

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
                      SizedBox(height: 175,),
                      InkWell(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 85),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 2,
                                    offset: Offset(0, 2)
                                )
                              ]
                          ),
                          child: Center(
                            child: Text(
                              "Submit", style:TextStyle(
                                color: Colors.yellow,fontWeight: FontWeight.bold,letterSpacing: 1.0

                            ),
                            ),
                          ),
                        ),
                        onTap: () {
                        },
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


