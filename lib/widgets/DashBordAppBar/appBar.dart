import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Screens/DashBord/BottonNavigation/Mother Page/Navigation Children/warehours center/warehouse.dart';
import '../../dark theme/themeClass.dart';

class SearchBars extends StatelessWidget {
  final String searchTitle;
  const SearchBars({super.key, required this.searchTitle});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
        height: 35,
        width: size / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Expanded(
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.5), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.5), width: 2.0),
              ),
              hintText: searchTitle,
              hintStyle: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 12,
              ),
              filled: false,
            ),
          ),
        ));
  }
}

class MyCustomAppBar extends StatefulWidget {
  final Widget myWidget;
  const MyCustomAppBar({super.key, required this.myWidget});

  @override
  State<MyCustomAppBar> createState() => _MyCustomAppBarState();
}

class _MyCustomAppBarState extends State<MyCustomAppBar> {
  final IconData lightIcon = Icons.wb_sunny;

  final IconData darkIcon = Icons.nightlight_round;

  //ThemeData _currentTheme = ThemeClass.lightTheme;
  ThemeMode currentThemeMode = ThemeMode.system;

  void _toggleLightTheme() {
    setState(() {
      currentThemeMode = ThemeMode.dark;
    });
  }

  void _toggleDarkTheme() {
    setState(() {
      currentThemeMode = ThemeMode.light;
    });
  }

  //bool _iconBool = false;
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 150,
      color: isDarkTheme ? const Color(0xFF3B3A38) : const Color(0xFF00376D),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Titus',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            widget.myWidget,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.changeTheme(ThemeClass.lightTheme);
                        },
                        child: Icon(
                          lightIcon,
                          size: 15,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.changeTheme(ThemeClass.darkTheme);
                        },
                        child: Icon(
                          darkIcon,
                          size: 15,
                          color: Colors.white,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Get.to(const Warehouse()),
                  child: Image.asset(
                    'assets/images/menu.png',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
