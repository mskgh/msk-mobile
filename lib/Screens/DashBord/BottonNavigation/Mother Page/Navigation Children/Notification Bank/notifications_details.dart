import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({super.key});

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final getNotifications = Get.arguments;

    final iconURL = getNotifications['iconURL'];
    final msg = getNotifications['msg'];
    final time = getNotifications['time'];
    final msgDisc = getNotifications['msgDisc'];
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            isDarkTheme ? const Color(0xFF32312F) : const Color(0xFFF5F5F5),
        body: Column(children: [
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: isDarkTheme
                        ? const Color(0xFF32312F)
                        : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xFFECE7FF),
                        child: ImageIcon(
                          AssetImage(iconURL),
                          size: 24,
                        ),
                      ),
                      title: Text(
                        msg,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppians',
                          //color: Color(),
                          color: isDarkTheme
                              ? Color(0xFFFFFFFF)
                              : Color(0xFF100D40),
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(time),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: size * 0.1),
                        Text(
                          msgDisc,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppians',
                            color: isDarkTheme
                                ? Color(0xFFF5F5F5)
                                : Color(0xFF32312F),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
