import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../../../../widgets/model/CardModels.dart';
import '../../../../../../../widgets/model/OrganizationDataProvider.dart';
import 'change_password_phone.dart';
import 'change_password_tablet.dart';



class ChangePassword extends StatefulWidget {
  const ChangePassword({
    super.key,
  });

  @override
  State<ChangePassword> createState() => _OrganizationState();
}

class _OrganizationState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    // Define the threshold width for switching between ListView and GridView
    const tabletThresholdWidth = 600;
    // Use ListView for phones and GridView for tablets
    final bodyWidget = size < tabletThresholdWidth
        ? const ChangePasswordPhone()
        : const ChangePasswordTablet();
        
    return Scaffold(body: bodyWidget);
  }
}
