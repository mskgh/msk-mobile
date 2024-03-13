





import 'package:flutter/material.dart';

import 'deleted_organization_TabletGrid.dart';
import 'deleted_organization_phoneList.dart';


class DeletedOrganizationsPageCenter extends StatefulWidget {
  const DeletedOrganizationsPageCenter({
    super.key,
  });

  @override
  State<DeletedOrganizationsPageCenter> createState() => _OrganizationState();
}

class _OrganizationState extends State<DeletedOrganizationsPageCenter> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    // Define the threshold width for switching between ListView and GridView
    const tabletThresholdWidth = 600;
    // Use ListView for phones and GridView for tablets
    final bodyWidget = size < tabletThresholdWidth
        ? const DeletedOrganizationsPagePhone()
        : const DeletedOrganizationsPageTablet();
        
    return Scaffold(body: bodyWidget);
  }
}
