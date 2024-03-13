
import 'package:flutter/material.dart';

import 'pendingDeletionTablet.dart';
import 'pendingDeletionphone.dart';


class PendingOrganizationCenter extends StatefulWidget {
  const PendingOrganizationCenter({
    super.key,
  });

  @override
  State<PendingOrganizationCenter> createState() => _PendingOrganizationCenterState();
}

class _PendingOrganizationCenterState extends State<PendingOrganizationCenter> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    // Define the threshold width for switching between ListView and GridView
    const tabletThresholdWidth = 600;
    // Use ListView for phones and GridView for tablets
    final bodyWidget = size < tabletThresholdWidth
        ? const PendingOrganizationPhone()
        : const PendingOrganizationTablet();
        
    return Scaffold(body: bodyWidget);
  }
}
