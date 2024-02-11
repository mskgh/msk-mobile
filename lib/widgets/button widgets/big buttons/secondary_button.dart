import 'package:flutter/material.dart';


class SecondaryButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPress;
  final Color color;

  const SecondaryButton(
      {super.key, required this.buttonName, required this.onPress, required this.color});

  @override
  Widget build(BuildContext context) {
    //double deviceSize = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
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
    );
  }
}
