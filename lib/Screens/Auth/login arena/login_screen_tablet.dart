import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../consts/text_styles.dart';
import '../../DashBord/BottonNavigation/Mother Page/main_page.dart';
import '../fogot_password arena/forgot_password center.dart';

class LoginScreenTablet extends StatefulWidget {
  const LoginScreenTablet({Key? key}) : super(key: key);

  @override
  State<LoginScreenTablet> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenTablet> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  final _emailController = TextEditingController();
  final password = TextEditingController();

  late bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor:
            isDarkTheme ? const Color(0xFF3B3A38) : const Color(0XFFFCFCFC),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size * 0.2),
              child: Center(
                  child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          // logo
                          height: size * logoSizeTablet,
                          child: Image.asset(logoURL)),
                      SizedBox(height: size * 0.05),
                      Text(
                          // welcome text
                          'Welcome Back',
                          style: TextStyles().kAuthHeaderTextStyleTablet),
                      const SizedBox(height: 5),
                  
                      // signin text
                      Text('sign in to access your account',
                          style: TextStyles().kAuthSubHeaderTextStyleTablet),
                      SizedBox(height: size * 0.1),
                  
                      // email textfield
                      TabletTextField(
                        focusNode1: _focusNode1,
                        hintTextName: 'Enter your Email',
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
                      SizedBox(height: size * 0.05),
                  
                      // password textield
                      TabletTextField(
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
                                  fontSize: 20,
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
                                fontSize: 20,
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
                      AuthButtonTablet(
                        size: size,
                        btnName: 'Login >',
                        onPress: () {
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
