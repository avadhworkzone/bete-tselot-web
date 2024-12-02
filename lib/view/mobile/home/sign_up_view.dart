import 'package:bete_tselot_web/CommonWidgets/custom_textfield.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppSignUpView extends StatefulWidget {
  const AppSignUpView({super.key});

  @override
  State<AppSignUpView> createState() => _AppSignUpViewState();
}

class _AppSignUpViewState extends State<AppSignUpView> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.w),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfff5f5f5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(0, 10),
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: EdgeInsets.all(50.w),
            child: Column(
              children: [
                CustomText(
                  "Sign up to receive latest product\nnews, exclusive content & more!",
                  textAlign: TextAlign.center,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.black29,
                ),
                SizedBox(
                  height: 20.w,
                ),
                CommonTextField(
                  textEditController: firstnameController,
                  hintText: "First Name",
                ),
                SizedBox(
                  height: 20.w,
                ),
                CommonTextField(
                  textEditController: lastnameController,
                  hintText: "Last Name",
                ),
                SizedBox(
                  height: 20.w,
                ),
                CommonTextField(
                  textEditController: emailController,
                  hintText: "E-mail address",
                ),
                SizedBox(
                  height: 30.w,
                ),
                CustomHoverButton(
                  text: StringUtils.signUp,
                  color: Colors.blue.shade700.withOpacity(0.7),
                  hoverColor: Colors.blue.shade700.withOpacity(0.9),
                  padding:
                  EdgeInsets.symmetric(horizontal: 70.w, vertical: 10.w),
                  onPressed: () {
                    if(firstnameController.text.isEmpty || lastnameController.text.isEmpty|| emailController.text.isEmpty){
                      Fluttertoast.showToast(
                          msg: "All Fields are required",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          // webBgColor: Colors.red,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          webBgColor: "linear-gradient(to right, #BB352E, #BB352E)",
                          fontSize: 16.0);
                    }else{
                      final firstName = firstnameController.text;
                      final lastName = lastnameController.text;
                      final email = emailController.text;
                      addDataToFirestore(firstName,lastName,email);
                    }
                  },
                )
              ],
            ),
          )),
    );
  }

  void addDataToFirestore(String firstName, String lastName,String email) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      firstnameController.clear();
      lastnameController.clear();
      emailController.clear();
      Fluttertoast.showToast(
          msg: "Thank you for Sign Up",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      firstnameController.clear();
      lastnameController.clear();
      emailController.clear();
      Fluttertoast.showToast(
          msg: "Something went Wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          // webBgColor: Colors.red,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          webBgColor: "linear-gradient(to right, #BB352E, #BB352E)",
          fontSize: 16.0);
      print('Error adding data: $e');
    }
  }
}
