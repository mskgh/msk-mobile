


import 'package:flutter/material.dart';

import 'business_Tablet.dart';
import 'bussiness_phone.dart';


class BusinessCenter extends StatefulWidget {
  const BusinessCenter({
    super.key,
  });

  @override
  State<BusinessCenter> createState() => _BusinessCenterState();
}

class _BusinessCenterState extends State<BusinessCenter> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    // Define the threshold width for switching between ListView and GridView
    const tabletThresholdWidth = 600;
    // Use ListView for phones and GridView for tablets
    final bodyWidget = size < tabletThresholdWidth
        ? const BusinessPhone()
        : const BusinessTablet();
        
    return Scaffold(body: bodyWidget);
  }
}
