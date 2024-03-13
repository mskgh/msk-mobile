import 'package:flutter/material.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import '../../../../widgets/button widgets/FABs/business_fab.dart';
import '../../../../widgets/button widgets/FABs/shops.dart';
import '../../../../widgets/button widgets/FABs/warehouse_fab.dart';
import 'Navigation Children/Business Bank/business_Center.dart';
import 'Navigation Children/Support Bank/support.dart';
import 'Navigation Children/organization bank/organizationCenter.dart';
import '../../../../widgets/button widgets/FABs/organization_fab.dart';
import 'Navigation Children/Notification Bank/Notifications.dart';
import 'Navigation Children/home.dart';

class MotherPage extends StatefulWidget {
  const MotherPage({Key? key}) : super(key: key);

  @override
  State<MotherPage> createState() => _MotherPageState();
}

class _MotherPageState extends State<MotherPage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Home(),
    const OrganizationHome(),
    const BusinessHome(),
    const Notifications(),
    const Support(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: isDarkTheme ? Colors.white : const Color(0xFF00376D),
        iconSize: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: isDarkTheme ? Colors.grey : Colors.black,
        backgroundColor:
            isDarkTheme ? const Color(0xFF3B3A38) : const Color(0xFF00376D),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage("assets/images/home-active.png")),
            icon: ImageIcon(AssetImage("assets/images/home.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon:
                ImageIcon(AssetImage("assets/images/organization-active.png")),
            icon: ImageIcon(AssetImage("assets/images/organization.png")),
            label: 'Organization',
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage("assets/images/business.png")),
            icon: ImageIcon(AssetImage("assets/images/business.png")),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            activeIcon:
                ImageIcon(AssetImage("assets/images/notification-active.png")),
            icon: ImageIcon(AssetImage("assets/images/notification.png")),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            activeIcon:
                ImageIcon(AssetImage("assets/images/support-active.png")),
            icon: ImageIcon(AssetImage("assets/images/support.png")),
            label: 'Support',
          ),
        ],
      ),
      floatingActionButton: SpeedDialFabWidget(
        primaryIconCollapse: Icons.close,
        rotateAngle: 500.0,
        primaryIconExpand: Icons.add,
        secondaryIconsList: const [
          Icons.shop,
          Icons.warehouse,
          Icons.business,
          Icons.group
        ],
        secondaryIconsText: const [
          "Shop",
          "Warehouse",
          "Business",
          "Organization",
        ],
        secondaryIconsOnPress: [
          () => {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return const Shops(); // Use your custom bottom sheet here
                  },
                ),
              },
          () => {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return const WarehouseFAB(); // Use your custom bottom sheet here
                  },
                ),
              },
          () => {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return const BusinessFAB(); // Use your custom bottom sheet here
                  },
                ),
              },
          () => {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return const OrganizationFAB(); // Use your custom bottom sheet here
                  },
                ),
              }
        ],
        // secondaryBackgroundColor: Colors.green,
        secondaryForegroundColor: const Color(0xFF00376D),
        primaryBackgroundColor: const Color(0xFF00376D),
        primaryForegroundColor: Colors.white,
      ),
    );
    // });
  }
}
