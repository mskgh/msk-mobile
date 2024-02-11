import 'package:flutter/material.dart';
import 'package:mobilemsk/Screens/Auth/change_password.dart';

import '../../consts/text_styles.dart';

class ProvideOTPScreen extends StatefulWidget {
  const ProvideOTPScreen({Key? key}) : super(key: key);

  @override
  State<ProvideOTPScreen> createState() => _ProvideOTPScreenState();
}

class _ProvideOTPScreenState extends State<ProvideOTPScreen> {
  final FocusNode _focusNode1 = FocusNode();

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
              child: Container(
                margin: EdgeInsets.only(bottom: height * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      //for logo
                      height: size * 0.20,
                      child: Image.asset('assets/images/msklogo.png'),
                    ),
                    SizedBox(height: size * 0.1),
                    const Text(
                        //for welcome text
                        'Provide OTP',
                        style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 24,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: size * 0.1),
                    ClipRRect(
                      //email field
                      borderRadius: BorderRadius.circular(10.0),
                      child: TextField(
                        focusNode: _focusNode1,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Enter OTP',
                          border: InputBorder.none,
                       enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xff1D4771)),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF3F3F3),
                        ),
                      ),
                    ),
                    SizedBox(height: size * 0.05),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: const Text(
                              'Didn\'t receive any code ?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            //login button
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: size * 0.35,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color(0xff1D4771),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text('Verify',
                                      style: TextStyles().kbuttonStyle),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) =>
                                          const ChangePassword()));
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
        )));
  }
}
