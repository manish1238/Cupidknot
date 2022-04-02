
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import 'package:http/http.dart' as http;

import '../utils/Widgets/button.dart';


class registration extends StatefulWidget {


  registration({Key? key, }) : super(key: key);

  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {

  bool _loading = false;



  bool _isValid = false;
  final TextEditingController _employerfirstname = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _employeremailid = TextEditingController();
  final TextEditingController _completeaddress = TextEditingController();
  final TextEditingController _distrt = TextEditingController();
  final TextEditingController _employerpincode = TextEditingController();
  int _value = 0;

  final _mob = GlobalKey<FormState>();
  final _firstname = GlobalKey<FormState>();
  final _emailid = GlobalKey<FormState>();
  final _completeaddres = GlobalKey<FormState>();
  final _district = GlobalKey<FormState>();
  final _pincode = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color=Colors.green;
    final color1 = Color(0xff205D80);
    return Scaffold(
      appBar: AppBar(title:Text("Registration")),
      body:  Container(
                color:Colors.white.withOpacity(0.8),
                child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,

                      height: 70,
                      child: Form(
                        key: _mob,
                        child: TextFormField(
                          controller: _mobile,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.add_ic_call_sharp,
                              color:color1,
                            ),
                            labelText: "Mobile Number",
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
                        key: _firstname,
                        child: TextFormField(
                          controller: _employerfirstname,
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
                          controller: _employeremailid,
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

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the Email ID';
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
                        key: _completeaddres,
                        child: TextFormField(
                          controller: _completeaddress,
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
                          controller: _employerpincode,
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



                          }
                        }

                    ),
                    SizedBox(height: size.height * 0.04),
                  ],
                ),
            ),
              ),

    );
  }
}
