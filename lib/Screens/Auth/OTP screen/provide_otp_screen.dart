import 'package:flutter/material.dart';
import 'provide_otp_screem_phone.dart';
import 'provide_otp_screem_tablet.dart';


class ProvideOTPScreen extends StatefulWidget {
  const ProvideOTPScreen({
    super.key,
  });

  @override
  State<ProvideOTPScreen> createState() => _OrganizationState();
}

class _OrganizationState extends State<ProvideOTPScreen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    // Define the threshold width for switching between ListView and GridView
    const tabletThresholdWidth = 600;
    // Use ListView for phones and GridView for tablets
    final bodyWidget = size < tabletThresholdWidth
        ? const ProvideOTPScreenPhone()
        : const ProvideOTPScreenTablet();
        
    return Scaffold(body: bodyWidget);
  }
}
