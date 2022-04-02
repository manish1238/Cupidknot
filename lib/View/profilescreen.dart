import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../utils/Widgets/ATextField.dart';
import '../utils/Widgets/button.dart';
import '../utils/Widgets/modalProgressHUD.dart';
import '../utils/styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isUpdate = false;
  bool isLoading = false;
  String address = "";
  String email = "";
  String name = "";

  @override
  void initState() {
    super.initState();
  }

  bool isloading = true;

  // User user = User("", "", "", "");
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      final value= await   showDialog<bool>(context: context,builder: (context){
        return AlertDialog(
          title:  Text("Alert"),
          content:  Text("Are you sure do you want to Exit"),
          actions: [
            ElevatedButton(onPressed: ()=>
                Navigator.of(context).pop(false),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
              child: Text('No',style: TextStyle(color: color1),),),

            ElevatedButton(onPressed: ()=>
                Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
              child: Text('Exit',style: TextStyle(color: color1),),),

          ],
        );
      });
      if(value!=null){
        return Future.value(value);
      }else{
        return Future.value(false);
      }
    },
      child: Scaffold(
        appBar: AppBar(title: Text("Profile"),centerTitle: true,automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Container(
              color: kBackgroundColor,
              child:
                  // Consumer<UserProvider>(builder: (context, data, child) {
                  //   address = data.user.address;
                  //   return
                  Center(
                      child:
                          // isloading
                          //     ? CircularProgressIndicator(color: Colors.blue,
                          // ):
                          Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ATextField(
                    key: UniqueKey(),
                    enabled: isUpdate,
                    onChanged: (value) {
                      name = value;
                    },
                    // initialText: data.user.name,
                    label: 'name',
                    borderColor: kPrimaryColor,
                    leadingIcon: Icon(
                      Mdi.account,
                      color: kThirdColor,
                    ),
                  ),
                  ATextField(
                    key: UniqueKey(),
                    enabled: false,
                    onChanged: () {},
                    borderColor: kPrimaryColor,
                    // initialText: data.user.mobile,
                    label: 'mobileno',
                    leadingIcon: Icon(
                      Mdi.phone,
                      color: kThirdColor,
                    ),
                  ),
                  ATextField(
                    key: UniqueKey(),
                    enabled: isUpdate,
                    onChanged: (value) {
                      email = value;
                    },
                    borderColor: kPrimaryColor,
                    // initialText:  email,
                    // initialText: data.user.email,
                    label: 'email',
                    leadingIcon: Icon(
                      Mdi.email,
                      color: kThirdColor,
                    ),
                  ),
                  ATextField(
                    key: UniqueKey(),
                    enabled: isUpdate,
                    onChanged: (value) {
                      address = value;
                    },
                    // initialText:  address,
                    // initialText:  data.user.address,
                    label: 'address',
                    borderColor: kPrimaryColor,
                    leadingIcon: Icon(
                      Mdi.mapMarker,
                      color: kThirdColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isUpdate
                      ? SizedBox()
                      : PSButton(
                          icon: Icon(
                            Mdi.accountEdit,
                            color: kFourthColor,
                          ),
                          text: 'Update Profile',
                          onPressed: () {
                            setState(() {
                              isUpdate = true;
                            });
                          }),
                  isUpdate
                      ? Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: PSButton(
                                  icon: Icon(
                                    Mdi.check,
                                    color: kFourthColor,
                                  ),
                                  text: 'submit',
                                  onPressed: () async {
                                    // if (await data.updateUser(name,address,email)) {
                                    //
                                    //   showToast('updateProfile');
                                    //   setState(() {
                                    //     isUpdate = false;
                                    //   });
                                    // } else {
                                    //   showToast('enterAddress');
                                    // }
                                  }),
                            ),
                            Expanded(
                              child: PSButton(
                                  icon: Icon(
                                    Mdi.close,
                                    color: kFourthColor,
                                  ),
                                  text: 'cancel',
                                  onPressed: () {
                                    setState(() {
                                      isUpdate = false;
                                      // address = data.user.address;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ))
              // }),
              ),
        ),
      ),
    );
  }
}
