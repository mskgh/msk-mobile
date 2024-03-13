import 'package:flutter/material.dart';
import 'phonelistview.dart';
import 'tabletgridview.dart';

class Organization extends StatefulWidget {
  const Organization({
    super.key,
  });

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    // Define the threshold width for switching between ListView and GridView
    const tabletThresholdWidth = 600;
    // Use ListView for phones and GridView for tablets
    final bodyWidget = size < tabletThresholdWidth
        ? const OrganizationPhoneListView()
        : const OrganizationTabletGridView();
        
    return Scaffold(body: bodyWidget);
  }
}
