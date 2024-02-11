import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/CardModels.dart';
import '../../model/OrganizationDataProvider.dart';
import '../big buttons/secondary_button.dart';

class OrganizationFAB extends StatefulWidget {
  const OrganizationFAB({super.key});

  @override
  State<OrganizationFAB> createState() => _OrganizationFABState();
}

class _OrganizationFABState extends State<OrganizationFAB> {

  //String? selectedValue; // Variable to store the selected value
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    

    List<String> locationOptions = [
      'Location',
      'Ghana, Accra, Spintex',
      'Ghana, Kumasi, Titus'
    ];
    String? selectedValue = 'Location';

    void handleSubmit() {
      final String orgName = nameController.text;
      final String orgLocation = selectedValue ?? " ";
      final String orgDescription = descriptionController.text;
      final String ids = UniqueKey().toString();

      final OrganizationCard newCard = OrganizationCard(
        id: ids,
        name: orgName,
        location: orgLocation,
        description: orgDescription,
      );

      final organizationDataProvider =
          Provider.of<OrganizationDataProvider>(context, listen: false);
      organizationDataProvider.addCard(newCard);

      Navigator.pop(context);
    }

    double size = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      heightFactor: 0.7,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size * 0.1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Organization',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.cancel_outlined)),
                ],
              ),
              SizedBox(height: size * 0.02),
              const Text(
                'Create your own Organization here',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size * 0.05),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 7.2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                    ),
                  ),
                ),
              ),
              SizedBox(height: size * 0.05),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 7.2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Location',
                      contentPadding: EdgeInsets.zero,
                    ),
                    items: locationOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value changes here
          
                      selectedValue = newValue;
                    },
                    // Set an initial value if needed
                    value: selectedValue,
                  ),
                ),
              ),
              SizedBox(height: size * 0.05),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 7.2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description...',
                    ),
                  ),
                ),
              ),
              SizedBox(height: size * 0.04),
              SecondaryButton(
                buttonName: 'Submit',
                onPress: handleSubmit,
                color: const Color(0xFF1D4771),
              )
            ],
          ),
        ),
      ),
    );
  }
}
