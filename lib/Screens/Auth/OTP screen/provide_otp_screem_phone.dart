import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/text_styles.dart';
import '../change_password arena/change_password_center.dart';

class ProvideOTPScreenPhone extends StatefulWidget {
  const ProvideOTPScreenPhone({Key? key}) : super(key: key);

  @override
  State<ProvideOTPScreenPhone> createState() => _ProvideOTPScreenPhoneState();
}

class _ProvideOTPScreenPhoneState extends State<ProvideOTPScreenPhone> {
  final FocusNode _focusNode1 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final OTP = TextEditingController();

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
              child: Container(
                margin: EdgeInsets.only(bottom: height * 0.2),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        //for logo
                        height: size * logoSizePhone,
                        child: Image.asset(logoURL),
                      ),
                      SizedBox(height: size * 0.1),
                      Text(
                          //for welcome text
                          'Provide OTP',
                          style: TextStyles().kAuthHeaderTextStyleTablet),
                      SizedBox(height: size * 0.05),
                      Text(
                          //for welcome text
                          'Enter your OTP code here!',
                          style: TextStyles().kAuthSubHeaderTextStyleTablet),
                      SizedBox(height: size * 0.1),
                      TextfieldWidgetPhone(
                        focusNode1: _focusNode1,
                        hintTextName: 'Enter OTP',
                        surfixIcon: Icons.code,
                        keyboardType: TextInputType.text,
                        controller: OTP,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an OTP';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size * 0.05),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Didn\'t receive any code ?',
                                style: TextStyle(
                                    color: isDarkTheme
                                        ? const Color(0xffFCFCFC)
                                        : const Color(0xFF3B3A38),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Color(0xff1D4771),
                                      content:
                                          Text('Code has been sent your mail.'),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Get code',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      //  color: Color(0xff1D4771),
                                      color: isDarkTheme
                                          ? const Color(0XFFFCFCFC)
                                          : const Color(0xff1D4771),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: AuthButtonPhone(
                              size: size,
                              btnName: 'Login >',
                              onpress: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.offAll(const ChangePassword(),
                                      duration: const Duration(seconds: 1),
                                      transition: Transition.native);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size * 0.025)
                    ],
                  ),
                ),
              ),
            ),
          ),
        )));
  }
}
