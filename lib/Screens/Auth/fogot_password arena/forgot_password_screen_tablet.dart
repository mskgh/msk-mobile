import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilemsk/Screens/Auth/OTP%20screen/provide_otp_screen.dart';

import '../../../consts/text_styles.dart';

class ForgotPasswordTablet extends StatefulWidget {
  const ForgotPasswordTablet({super.key});

  @override
  State<ForgotPasswordTablet> createState() => _ForgotPasswordTabletState();
}

//----------------------------------------------
// an email controller
//----------------------------------------------
final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final password = TextEditingController();

final FocusNode _focusNode1 = FocusNode();
const bool _isFocused1 = false;



class _ForgotPasswordTabletState extends State<ForgotPasswordTablet> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDarkTheme ? const Color(0xFF3B3A38) : const Color(0XFFFCFCFC),
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
          padding: EdgeInsets.symmetric(horizontal: size * 0.2),
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
                          height: size * logoSizeTablet,
                          child: Image.asset(logoURL)),
                      SizedBox(height: size * 0.05),

                      Text('Forgot Password',
                          style: TextStyles().kAuthHeaderTextStyleTablet),
                      SizedBox(height: size * 0.01),

                      Text(
                          textAlign: TextAlign.center,
                          'Enter your email address or phone number, A code will be send to you',
                          style: TextStyles().kAuthSubHeaderTextStyleTablet),
                      SizedBox(height: size * 0.1),

                      //----------------------------------------------
                      // Email TextField
                      //----------------------------------------------
                      TabletTextField(
                        focusNode1: _focusNode1,
                        hintTextName: 'Email/Contact',
                        surfixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                         controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@') ||
                              !value.contains('gmail')) {
                            return 'Please enter a valid Gmail address';
                          }
                          return null;
                        },
                      ),

                      //----------------------------------------------
                      // Button
                      //----------------------------------------------
                      SizedBox(height: size * 0.05),

                      AuthButtonTablet(
                        size: size,
                        btnName: 'Confirm',
                        onPress: () {
                           if (_formKey.currentState!.validate()) {
                            Get.off(const ProvideOTPScreen(),
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
