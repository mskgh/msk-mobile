import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../../../widgets/DashBordAppBar/appBar.dart';
import 'notification_model.dart';
import 'notifications_details.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String currentTime = DateFormat.jm().format(DateTime.now());

  void resetIsRead(NotificationModel notification) {
    setState(() {
      notification.isRead = true;
    });
  }

  // Maintain a set to store clicked notification IDs
  Set<int> clickedNotifications = {};

  // Function to handle tap on a notification
  void handleNotificationTap(NotificationModel notification) {
    setState(() {
      // Check if the notification has been clicked before
      if (!clickedNotifications.contains(notification.isRead)) {
        // First time clicking this notification, change color and add to clicked list
        notification.isRead = true;
        //clickedNotifications.add(notification.isRead);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // appBar: const CustomAppBar(child: Text('Notifications')),
      body: Column(
        children: [
          const MyCustomAppBar(
              myWidget: Text(
            "Notification",
            style: TextStyle(color: Colors.white),
          )),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final getNotify = notifications[index];
                // final bgColor = getNotify.isRead
                //     ? (isDarkTheme ? const Color(0xFF32312F) : Colors.white)
                //     : (isDarkTheme
                //         ? const Color(0xFF32312F)
                //         : const Color(0xFFF5F5F5));

                final bgColor = getNotify.isRead
                    ? (isDarkTheme ? const Color(0xFF32312F) : Colors.white)
                    : (isDarkTheme
                        ? const Color(0xFF32312F)
                        : const Color(0xFFF5F5F5));

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle the 'isRead' property when the notification is tapped again.
                      getNotify.isRead = !getNotify.isRead;

                      //Check if isRead is true, reset it back to false
                      if (getNotify.isRead == true) {
                        // Colors.amber;
                        resetIsRead(getNotify);
                      }
                    });

                    Get.to(
                      const NotificationDetail(),
                      arguments: {
                        'iconURL': getNotify.iconURL,
                        'msg': getNotify.msg,
                        'time': getNotify.time,
                        'msgDisc': getNotify.msgDisc,
                      },
                      duration: const Duration(seconds: 1),
                      transition: Transition.native,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: bgColor,
                      // color: getNotify.isRead ? Colors.black : Colors.amber,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 120,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xFFECE7FF),
                        child: ImageIcon(
                          AssetImage(getNotify.iconURL),
                          size: 30,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(getNotify.msg),
                          Expanded(child: Container()),
                          Text(getNotify.time),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
