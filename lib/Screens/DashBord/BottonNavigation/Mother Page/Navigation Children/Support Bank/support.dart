import 'package:flutter/material.dart';
import '../../../../../../widgets/DashBordAppBar/appBar.dart';
import 'support_model.dart';

class Support extends StatelessWidget {
  const Support({Key? key});
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          isDarkTheme ? const Color(0xFF32312F) : const Color(0xFFFEFEFE),
      body: Stack(
        children: [
          Column(
            children: [
              const MyCustomAppBar(
                myWidget: Text(
                  "Support",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: size / 5),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppians',
                            color: isDarkTheme
                                ? const Color(0xFFFFFFFF)
                                : const Color(0XFF000000),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Cardy(
                        cardName: "Change Personal Profile",
                        icon: Icons.person,
                      ),
                      const Cardy(
                        cardName: "Change Email Address",
                        icon: Icons.email_outlined,
                      ),
                      const Cardy(
                        cardName: "Change Password",
                        icon: Icons.padding_rounded,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'More Settings',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppians',
                            color: isDarkTheme
                                ? const Color(0xFFFFFFFF)
                                : const Color(0XFF000000),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Cardy(
                        cardName: "Account Security",
                        icon: Icons.lock,
                      ),
                      const Cardy(
                        cardName: "Help and Privacy",
                        icon: Icons.help,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 120,
              child: Card(
                elevation: isDarkTheme ? 50 : 10,
                color: isDarkTheme
                    ? const Color(0xFF3B3A38)
                    : const Color(0XFFFFFFFF),
                surfaceTintColor: isDarkTheme
                    ? const Color(0xFF3B3A38)
                    : const Color(0XFFFFFFFF),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  trailing: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDarkTheme
                          ? const Color(0xFF3B3A38)
                          : const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: isDarkTheme ? Colors.white : Colors.grey,
                        width: isDarkTheme ? 1.5 : 0.5,
                      ),
                    ),
                    child: Text(
                      "Basic",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppians',
                        color: isDarkTheme
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF3B3A38),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  leading: const CircleAvatar(
                      radius: 35,
                      backgroundColor: Color(0xFFECE7FF),
                      child: Icon(Icons.person)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: size / 20),
                      const Text("Mr. Kenneth Owusu"),
                      const Text("+233 54 550 4645"),
                      SizedBox(height: size / 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
