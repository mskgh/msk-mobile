import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilemsk/Screens/Auth/provide_otp_screen.dart';

import '../../widgets/button widgets/big buttons/primary_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

//----------------------------------------------
// an email controller
//----------------------------------------------
final _formKey = GlobalKey<FormState>();
// final _emailController = TextEditingController();

final FocusNode _focusNode1 = FocusNode();

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: size * 0.06, bottom: size * 0.05),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff1D4771),
          child: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size * 0.1),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(bottom: height * 0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          //for logo
                          height: size * 0.20,
                          child: Image.asset('assets/images/msklogo.png')),
                      SizedBox(height: size * 0.1),

                      const Text('Forgot Password',
                          style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: size * 0.1),
                      //----------------------------------------------
                      // Email TextField
                      //----------------------------------------------
                      ClipRRect(
                        //email field
                        borderRadius: BorderRadius.circular(10.0),
                        child: TextField(
                          focusNode: _focusNode1,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email/Contact',
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFF3F3F3)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xff1D4771), width: 2.0),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF3F3F3),
                          ),
                        ),
                      ),
                      //----------------------------------------------
                      // Button
                      //----------------------------------------------
                      SizedBox(height: size * 0.05),

                      PrimaryButton(
                        buttonName: 'Confirm',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(const ProvideOTPScreen(),
                                duration: const Duration(seconds: 1),
                                transition: Transition.native);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
