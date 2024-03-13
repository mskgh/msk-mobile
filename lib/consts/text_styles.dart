import 'package:flutter/material.dart';

String logoURL = 'assets/images/msklogo.png';
double logoSizeTablet = 0.15;
double logoSizePhone = 0.20;

class TextStyles {
  TextStyle kbuttonStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat-Regular',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      letterSpacing: 2.0);

  TextStyle kAuthHeaderTextStyleTablet = const TextStyle(
      fontFamily: 'Montserrat-Regular',
      fontSize: 30,
      fontWeight: FontWeight.w600);

  TextStyle kAuthSubHeaderTextStyleTablet = const TextStyle(
      fontFamily: 'Montserrat-Regular',
      fontSize: 20,
      fontWeight: FontWeight.w300);
}

const TextStyle darkModeTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
);



class AuthButtonTablet extends StatelessWidget {
  final String btnName;
  final VoidCallback onPress;
  const AuthButtonTablet({
    super.key,
    required this.size,
    required this.btnName, required this.onPress,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPress,
        child: Container(
          width: size * 0.25,
          height: 80,
          decoration: BoxDecoration(
              color: const Color(0xff1D4771),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(btnName, style: TextStyles().kbuttonStyle),
          ),
        ),
      ),
    );
  }
}


class TabletTextField extends StatelessWidget {
  final String hintTextName;
  final IconData surfixIcon;
  final bool obscureText;

   final TextEditingController controller;
  final String? Function(dynamic value)? validator;
  final TextInputType keyboardType;

  const TabletTextField({
    super.key,
    required FocusNode focusNode1,
    this.obscureText = false,
    required this.hintTextName,
    required this.surfixIcon,
    required this.controller,
    this.validator, 
    required this.keyboardType,
  }) : _focusNode1 = focusNode1;

  final FocusNode _focusNode1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //email field
      borderRadius: BorderRadius.circular(10.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        style: const TextStyle(fontSize: 25),
        focusNode: _focusNode1,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: hintTextName,
            hintStyle: const TextStyle(color: Color(0xFF3B3A38), fontSize: 20),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color(0xff1D4771), width: 2.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            filled: true,
            fillColor: const Color(0xFFF3F3F3),
            suffixIcon: Icon(surfixIcon, color: const Color(0xff1D4771))),
      ),
    );
  }
}






class AuthButtonPhone extends StatelessWidget {
  final String btnName;
  final VoidCallback onpress;
  const AuthButtonPhone({
    super.key,
    required this.size, required this.btnName, required this.onpress,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onpress,
        child: Container(
          width: size * 0.35,
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xff1D4771),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(btnName,
                style: TextStyles().kbuttonStyle),
          ),
        ),
      ),
    );
  }
}





//---------------------
//  phone text field
//---------------------
class TextfieldWidgetPhone extends StatelessWidget {
  final String hintTextName;
  final IconData surfixIcon;
  final bool obscureText;

  final TextEditingController controller;
  final String? Function(dynamic value)? validator;
  final TextInputType keyboardType;
  
  const TextfieldWidgetPhone({
    super.key,
    required FocusNode focusNode1,
    this.obscureText = false,
    required this.hintTextName,
    required this.surfixIcon, 
    required this.controller, 
    this.validator, 
    required this.keyboardType,
  }) : _focusNode1 = focusNode1;

  final FocusNode _focusNode1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //email field
      borderRadius: BorderRadius.circular(10.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        focusNode: _focusNode1,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: hintTextName,
            hintStyle: const TextStyle(color: Color(0xFF3B3A38)),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color(0xff1D4771), width: 2.0),
            ),
            filled: true,
            fillColor: const Color(0xFFF3F3F3),
            suffixIcon: Icon(surfixIcon, color: const Color(0xff1D4771))),
      ),
    );
  }
}


