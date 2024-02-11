import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPress;

  const PrimaryButton(
      {super.key, required this.buttonName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    double deviceSize = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPress,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 50,
          width: deviceSize * 0.35,
          decoration: BoxDecoration(
              color: const Color(0xFF1D4771),
              borderRadius: BorderRadius.circular(10.0)),
          child: Center(
              child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 20,
              letterSpacing: 2,
              fontFamily: 'Montserrat-Regular',
              color: Colors.white,
            ),
          )),
        ),
      ),
    );
  }
}
