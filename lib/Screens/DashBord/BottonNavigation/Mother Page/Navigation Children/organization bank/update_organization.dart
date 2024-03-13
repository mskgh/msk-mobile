import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/button widgets/big buttons/secondary_button.dart';
import '../../../../../../widgets/model/CardModels.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';

class UpdateOrganization extends StatefulWidget {
  final OrganizationCard oldCard;
  const UpdateOrganization({Key? key, required this.oldCard}) : super(key: key);

  @override
  State<UpdateOrganization> createState() => _UpdateOrganizationState();
}

class _UpdateOrganizationState extends State<UpdateOrganization> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> locationOptions = [
    'Location',
    'Ghana, Accra, Spintex',
    'Ghana, Kumasi, Titus'
  ];
  String? selectedValue = 'Location';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  final FocusNode _focusNode1 = FocusNode();
  final bool _focusNode = true;

  void handleUpdate(context) {
    final organizationDataProvider =
        Provider.of<OrganizationDataProvider>(context, listen: false);

    final String orgName = nameController.text;
    final String orgLocation = selectedValue ?? " ";
    final String orgDescription = descriptionController.text;
    final String ids = widget.oldCard.id;

    final updatedCard = OrganizationCard(
        id: ids,
        name: orgName,
        location: orgLocation,
        description: orgDescription
        // Update other properties as needed
        );

    organizationDataProvider.updateCard(updatedCard);

    // Provide feedback to the user (e.g., show a snackbar or navigate back)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Organization updated successfully!'),
      ),
    );

    // You can also navigate back to the previous page if needed
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    final organizationDataProvider =
        Provider.of<OrganizationDataProvider>(context);

    void handleClick(organizationCard) {
      organizationDataProvider.removeCard(organizationCard);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text(
      //         'Your deleted organization has been moved to pending deletion'),
      //   ),
      // );
    }

    return FractionallySizedBox(
        heightFactor: 0.80,
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Update Organization',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppians',
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.cancel_outlined)),
                  ],
                ),
                SizedBox(height: size * 0.05),
                TextField(
                  // focusNode: _focusNode,
                  controller: nameController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.oldCard.name),
                ),
                SizedBox(height: size * 0.05),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: widget.oldCard.location,
                  ),
                  items: locationOptions
                      .map<DropdownMenuItem<String>>((String value) {
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
                ),
                SizedBox(height: size * 0.05),
                TextField(
                  controller: descriptionController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: widget.oldCard.description,
                  ),
                ),
                SizedBox(height: size * 0.075),
                SecondaryButton(
                  buttonName: 'Update',
                  onPress: () {
                    // OrganizationCard organizationCard = OrganizationCard(id: id, name: org, location: location, description: description)
                    handleUpdate(context);
                    //organizationDataProvider.EaddCard(organizationCard);
                  },
                  color: const Color(0xFF1D4771),
                  //onPress: () => handleUpdate(context)
                ),
                SizedBox(height: size * 0.05),
                SecondaryButton(
                  buttonName: 'Delete',
                  onPress: () {
                    Navigator.pop(context);
                  },
                  color: const Color(0xFFEF0000),
                  //onPress: () => handleUpdate(context))
                ),
              ],
            ),
          ),
        )));
  }
}
