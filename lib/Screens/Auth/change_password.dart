import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/Text Field Widgets/textfields.dart';
import '../../widgets/button widgets/big buttons/primary_button.dart';
import '../DashBord/BottonNavigation/Mother Page/main_page.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

//----------------------------------------------
// an email controller
//----------------------------------------------
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _oldPassword = TextEditingController();
final _newPassword = TextEditingController();
final _confirmPassword = TextEditingController();

class _ChangePasswordState extends State<ChangePassword> {
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
                    children: [
                      SizedBox(
                          //for logo
                          height: size * 0.20,
                          child: Image.asset('assets/images/msklogo.png')),
                      // Image.asset(
                      //   'assets/images/msklogo.png',
                      //   height: 76,
                      //   width: 76,
                      // ),
                      SizedBox(height: size * 0.1),
                      const Text('Change Password',
                          style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: size * 0.1),
                      MyTextField(
                        controller: _emailController,
                        hintext: 'Email/ Contact',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email/contact';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: size * 0.05),
                      MyTextField(
                        controller: _oldPassword,
                        hintext: 'Old Password',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your old password';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: size * 0.05),
                      MyTextField(
                        controller: _newPassword,
                        hintext: 'New Password',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a new password';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: size * 0.05),
                      MyTextField(
                        controller: _confirmPassword,
                        hintext: 'Confirm Password',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _newPassword.text) {
                            return 'Passwords do not match';
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
