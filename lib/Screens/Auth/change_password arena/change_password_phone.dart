import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../consts/text_styles.dart';
import '../../../widgets/Text Field Widgets/textfields.dart';
import '../../../widgets/button widgets/big buttons/primary_button.dart';
import '../../DashBord/BottonNavigation/Mother Page/main_page.dart';

class ChangePasswordPhone extends StatefulWidget {
  const ChangePasswordPhone({super.key});

  @override
  State<ChangePasswordPhone> createState() => _ChangePasswordState();
}

//----------------------------------------------
// an email controller
//----------------------------------------------
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _oldPassword = TextEditingController();
final _newPassword = TextEditingController();
final _confirmPassword = TextEditingController();

final FocusNode _focusNode1 = FocusNode();
final FocusNode _focusNode2 = FocusNode();
final FocusNode _focusNode3 = FocusNode();
final FocusNode _focusNode4 = FocusNode();

class _ChangePasswordState extends State<ChangePasswordPhone> {
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
                    children: [
                      SizedBox(
                          //for logo
                          height: size * logoSizePhone,
                          child: Image.asset(logoURL)),
                      SizedBox(height: size * 0.1),
                      Text('Change Password',
                          style: TextStyles().kAuthHeaderTextStyleTablet),
                      SizedBox(height: size * 0.1),
                      TextfieldWidgetPhone(
                        focusNode1: _focusNode1,
                        hintTextName: 'Email/Contact',
                        surfixIcon: Icons.email,
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
                      SizedBox(height: size * 0.05),
                      TextfieldWidgetPhone(
                        focusNode1: _focusNode2,
                        hintTextName: 'Old Password',
                        obscureText: true,
                        controller: _oldPassword,
                        keyboardType: TextInputType.visiblePassword,
                        surfixIcon: Icons.password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size * 0.05),
                      TextfieldWidgetPhone(
                        focusNode1: _focusNode3,
                        hintTextName: 'New Password',
                        obscureText: true,
                        controller: _newPassword,
                        keyboardType: TextInputType.visiblePassword,
                        surfixIcon: Icons.password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size * 0.05),
                      TextfieldWidgetPhone(
                        focusNode1: _focusNode4,
                        hintTextName: 'Confirm Password',
                        obscureText: true,
                        controller: _confirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        surfixIcon: Icons.password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          } else if (_newPassword.text !=
                              _confirmPassword.text) {
                            return 'password mismatch';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size * 0.05),
                      SizedBox(height: size * 0.05),
                      PrimaryButton(
                        buttonName: 'Confirm',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(const MotherPage(),
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
