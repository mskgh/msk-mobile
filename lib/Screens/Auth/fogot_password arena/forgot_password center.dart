import 'package:flutter/material.dart';
import 'forget_password_screen_phone.dart';
import 'forgot_password_screen_tablet.dart';



class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  State<ForgotPassword> createState() => _OrganizationState();
}

class _OrganizationState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    // Define the threshold width for switching between ListView and GridView
    const tabletThresholdWidth = 600;
    // Use ListView for phones and GridView for tablets
    final bodyWidget = size < tabletThresholdWidth
        ? const ForgotPasswordPhone()
        : const ForgotPasswordTablet();
        
    return Scaffold(body: bodyWidget);
  }
}
