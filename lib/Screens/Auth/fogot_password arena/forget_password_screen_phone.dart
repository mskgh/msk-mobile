import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilemsk/Screens/Auth/OTP%20screen/provide_otp_screen.dart';

import '../../../consts/text_styles.dart';

class ForgotPasswordPhone extends StatefulWidget {
  const ForgotPasswordPhone({super.key});

  @override
  State<ForgotPasswordPhone> createState() => _ForgotPasswordPhoneState();
}

//----------------------------------------------
// an email controller
//----------------------------------------------
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
// final _emailController = TextEditingController();

final FocusNode _focusNode1 = FocusNode();

class _ForgotPasswordPhoneState extends State<ForgotPasswordPhone> {
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
                          height: size * logoSizePhone,
                          child: Image.asset(logoURL)),
                      SizedBox(height: size * 0.1),

                      Text('Forgot Password',
                          style: TextStyles().kAuthHeaderTextStyleTablet),
                      SizedBox(height: size * 0.02),

                      Text(
                          textAlign: TextAlign.center,
                          "Provide your email or phone number, and we'll send you a verification code.",
                          style: TextStyles().kAuthSubHeaderTextStyleTablet),
                      SizedBox(height: size * 0.1),
                      //----------------------------------------------
                      // Email TextField
                      //----------------------------------------------

                      TextfieldWidgetPhone(
                        focusNode1: _focusNode1,
                        hintTextName: 'Email/Contact',
                        surfixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email/contact';
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
                      AuthButtonPhone(
                        size: size,
                        btnName: 'Confirm',
                        onpress: () {
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
