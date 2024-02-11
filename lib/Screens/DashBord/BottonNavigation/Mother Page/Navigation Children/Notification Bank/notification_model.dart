import 'package:intl/intl.dart';

class NotificationModel {
  String iconURL; 
  String msg;
  String msgDisc;
  String time; 
  bool isRead;

 

  NotificationModel(
    this.msgDisc,
    {
    required this.iconURL,
    required this.msg,
  }) : time = DateFormat.jm().format(DateTime.now()), isRead = false;
}

List<NotificationModel> notifications = [
  NotificationModel(
    iconURL: 'assets/images/Request-money.png',
    'The breadth of the themes covered in this category is refreshing and extensive, providing insight into areas that are relevant for decision-making for your business. Strategic Watch is specially designed by Mystorekeeper to provide in-depth information on global and national. business occurances, and how they impact your business and finances. Thank you for joining MSK',
    msg: 'You have received DHC product from Dodi Enterprise #QPP-2EBR',
  ),

  NotificationModel(
    'The breadth of the themes covered in this category is refreshing and extensive, providing insight into areas that are relevant for decision-making for your business. Strategic Watch is specially designed by Mystorekeeper to provide in-depth information on global and national. business occurances, and how they impact your business and finances. Thank you for joining MSK',
    iconURL: 'assets/images/Send-money.png',
    msg: 'You have sent product to Warehouse #DLQ-PZE3',
  ),

  NotificationModel(
    'The breadth of the themes covered in this category is refreshing and extensive, providing insight into areas that are relevant for decision-making for your business. Strategic Watch is specially designed by Mystorekeeper to provide in-depth information on global and national. business occurances, and how they impact your business and finances. Thank you for joining MSK',
    iconURL: 'assets/images/U.png',
    msg: 'Category 56 business announce its new product upgrade and shipping',
  ),

  NotificationModel(
    'The breadth of the themes covered in this category is refreshing and extensive, providing insight into areas that are relevant for decision-making for your business. Strategic Watch is specially designed by Mystorekeeper to provide in-depth information on global and national. business occurances, and how they impact your business and finances. Thank you for joining MSK',
    iconURL: 'assets/images/Send-money.png',
    msg: 'You have sent money to Alexanderius Williamson -\$87.00',
  ),

  NotificationModel(
    'The breadth of the themes covered in this category is refreshing and extensive, providing insight into areas that are relevant for decision-making for your business. Strategic Watch is specially designed by Mystorekeeper to provide in-depth information on global and national. business occurances, and how they impact your business and finances. Thank you for joining MSK',
    iconURL: 'assets/images/Request-money.png',
    msg: 'You have received money from Dean Esterson +\$92.30',
  ),
 
];
