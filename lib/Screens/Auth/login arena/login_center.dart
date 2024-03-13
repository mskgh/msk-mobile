import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../../../../widgets/model/CardModels.dart';
import '../../../../../../../widgets/model/OrganizationDataProvider.dart';
import 'login_screen_phone.dart';
import 'login_screen_tablet.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _OrganizationState();
}

class _OrganizationState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    // Define the threshold width for switching between ListView and GridView
    const tabletThresholdWidth = 600;
    // Use ListView for phones and GridView for tablets
    final bodyWidget = size < tabletThresholdWidth
        ? const LoginScreenPhone()
        : const LoginScreenTablet();
        
    return Scaffold(body: bodyWidget);
  }
}
