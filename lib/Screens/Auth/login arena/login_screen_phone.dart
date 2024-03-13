import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../consts/text_styles.dart';
import '../../DashBord/BottonNavigation/Mother Page/main_page.dart';
import '../fogot_password arena/forgot_password center.dart';

class LoginScreenPhone extends StatefulWidget {
  const LoginScreenPhone({Key? key}) : super(key: key);

  @override
  State<LoginScreenPhone> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenPhone> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final password = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  late bool isChecked = true;
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
        backgroundColor:
            isDarkTheme ? const Color(0xFF3B3A38) : const Color(0XFFFCFCFC),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(size * 0.1),
              child: Center(
                  child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          //for logo
                          height: size * logoSizePhone,
                          child: Image.asset(logoURL)),
                      SizedBox(height: size * 0.1),
                      Text(
                          //for welcome text
                          'Welcome back',
                          style: TextStyles().kAuthHeaderTextStyleTablet),
                      const SizedBox(height: 5),
                      Text(
                          //for signin text
                          'sign in to access your account',
                          style: TextStyles().kAuthSubHeaderTextStyleTablet),
                      SizedBox(height: size * 0.1),
                      TextfieldWidgetPhone(
                        focusNode1: _focusNode1,
                        hintTextName: 'Enter your email',
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
                        hintTextName: 'Password',
                        obscureText: true,
                        controller: password,
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
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  color: isDarkTheme
                                      ? const Color(0XFFFCFCFC)
                                      : const Color(0xff1D4771),
                                ),
                              )
                            ],
                          ),
                          TextButton(
                            //forget password
                            child: Text(
                              'Forget password ?',
                              style: TextStyle(
                                color: isDarkTheme
                                    ? const Color(0XFFFCFCFC)
                                    : const Color(0xff1D4771),
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
                      AuthButtonPhone(
                        size: size,
                        btnName: 'Login >',
                        onpress: () {
                          if (_formKey.currentState!.validate()) {
                            Get.off(const MotherPage(),
                                duration: const Duration(seconds: 1),
                                transition: Transition.native);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ))),
        ));
  }
}
