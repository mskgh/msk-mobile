import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../consts/text_styles.dart';
import '../DashBord/BottonNavigation/Mother Page/main_page.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode1 = FocusNode();
  final bool _isFocused1 = false;
  final FocusNode _focusNode2 = FocusNode();
  final bool _isFocused2 = false;
  late bool isChecked = false;
  late bool isObscured = true;

  @override
  void initState() {
    isObscured = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: isDarkTheme
                      ? const Color(0xFF3B3A38)
                      : const Color(0XFFFCFCFC),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(size * 0.1),
              child: Center(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        //for logo
                        height: size * 0.20,
                        child: Image.asset('assets/images/msklogo.png')),
                    SizedBox(height: size * 0.1),
                    const Text(
                        //for welcome text
                        'Welcome back',
                        style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 24,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    const Text(
                      //for signin text
                      'sign in to access your account',
                      style: TextStyle(
                        fontFamily: 'Montserrate',
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: size * 0.1),
                    ClipRRect(
                      //email field
                      borderRadius: BorderRadius.circular(10.0),
                      child: TextField(
                        focusNode: _focusNode1,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
          ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xff1D4771), width: 2.0),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF3F3F3),
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              color: _isFocused1
                                  ? const Color(0xff1D4771)
                                  : Colors.grey,
                            )),
                      ),
                    ),
                    SizedBox(height: size * 0.05),
                    ClipRRect(
                      //password field
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        obscureText: isObscured,
                        focusNode: _focusNode2,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
          ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xff1D4771), width: 2.0),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF3F3F3),
                            suffixIcon: Icon(
                              Icons.lock_outline,
                              color: _isFocused2 ? Colors.grey : Colors.grey,
                            )),
                      ),
                    ),
                    SizedBox(height: size * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: const Color(0xff1D4771),
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Text('Remember me')
                          ],
                        ),
                        TextButton(
                          //forget password
                          child: const Text(
                            'Forget password ?',
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
                          },
                        )
                      ],
                    ),
                    SizedBox(height: size * 0.05),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {Get.to(const MotherPage());},
                        child: Container(
                          width: size * 0.35,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xff1D4771),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text('Login  >',
                                style: TextStyles().kbuttonStyle),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
        ));
  }
}
