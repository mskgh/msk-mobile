import 'package:flutter/material.dart';

import '../../../../../../widgets/button widgets/big buttons/secondary_button.dart';



class OrganizationSettings extends StatefulWidget {
  const OrganizationSettings({super.key});

  @override
  State<OrganizationSettings> createState() => _OrganizationSettingsState();
}

class _OrganizationSettingsState extends State<OrganizationSettings> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> locationOptions = [
    'Location',
    'Ghana, Accra, Spintex',
    'Ghana, Kumasi, Titus'
    'Ghana, Kumasi, Titus'
    'Ghana, Kumasi, Titus'
  ];
  String? selectedValue = 'Location';

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
            ),
            SizedBox(height: size * 0.05),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Location',
              ),
              items:
                  locationOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              value: selectedValue,
            ),
            SizedBox(height: size * 0.05),
            TextField(
              controller: descriptionController,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description...',
              ),
            ),
            SizedBox(height: size * 0.075),
            SecondaryButton(
              buttonName: 'Update', onPress: () {},
              color: const Color(0xFF1D4771),
              //onPress: () => handleUpdate(context)
            ),
            SizedBox(height: size * 0.05),
            SecondaryButton(
              buttonName: 'Delete', onPress: () {},
              color: const Color(0xFFEF0000),
              //onPress: () => handleUpdate(context) background: #;
            ),
          ],
        ),
      ),
    ));
  }
}
