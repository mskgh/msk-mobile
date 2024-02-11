


import 'package:flutter/material.dart';

class Cardy extends StatelessWidget {
  final String cardName;
  final IconData icon;

  const Cardy({super.key, required this.cardName, required this.icon});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          color:
              isDarkTheme ? const Color(0xFF3B3A38) : const Color(0XFFFFFFFF),
          surfaceTintColor:
              isDarkTheme ? const Color(0xFF3B3A38) : const Color(0XFFFFFFFF),
          margin: const EdgeInsets.all(5),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            trailing: const Icon(Icons.arrow_forward_sharp),
            leading: CircleAvatar(
                radius: 35,
                backgroundColor: const Color(0xFFECE7FF),
                child: Icon(icon)),
            title: Center(child: Text(cardName)),
          ),
        ),
      ),
    );
  }
}
