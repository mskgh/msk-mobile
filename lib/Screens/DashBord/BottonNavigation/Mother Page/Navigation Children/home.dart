import 'package:flutter/material.dart';

import '../../../../../widgets/DashBordAppBar/appBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: const CustomAppBar(
      //     child: ImageIcon(
      //   size: 70,
      //   color: Colors.white,
      //   AssetImage(
      //     'assets/images/msklogo.png',
      //   ),
      // )
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyCustomAppBar(myWidget: ImageIcon(
        size: 70,
        color: Colors.white,
        AssetImage(
          'assets/images/msklogo.png',
        ),
      ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size * 0.5),
              Image.asset(
                'assets/images/no-organization.png',
                height: 100,
              ),
              const Text(
                'No business has been created',
                style: TextStyle(
                  fontFamily: 'Poppians',
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
