import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(size*0.1),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: height*0.1),
                child: const Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                        child: Text('Welcome To Home',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )

      ),
    );
  }
}
