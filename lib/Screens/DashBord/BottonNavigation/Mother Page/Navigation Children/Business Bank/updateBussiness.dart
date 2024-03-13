import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/button widgets/big buttons/secondary_button.dart';
import '../../../../../../widgets/model/CardModels.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';

class UpdateBussiness extends StatefulWidget {
  final BusinessCard oldBusCard;
  const UpdateBussiness({Key? key, required this.oldBusCard}) : super(key: key);

  @override
  State<UpdateBussiness> createState() => _UpdateBussinessState();
}

class _UpdateBussinessState extends State<UpdateBussiness> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> locationOptions = [
    'Location',
    'Ghana, Accra, Spintex',
    'Ghana, Kumasi, Titus'
  ];
  String? selectedValue = 'Location';

  List<String> selectedOrg = ['Organization', 'Organ 1', 'Organ 2'];
  String? OrganSelected = 'Organization';

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
    final bussinessDataProvider =
        Provider.of<BusinessDataProvider>(context, listen: false);

    final String bussName = nameController.text;
    final String bussLocation = selectedValue ?? " ";
    final String selectedOrganization = OrganSelected ?? " ";
    final String orgDescription = descriptionController.text;
    final String ids = widget.oldBusCard.id;

    final updatedCard = BusinessCard(
        id: ids,
        name: bussName,
        location: bussLocation,
        description: orgDescription,
        selectedOrganization: selectedOrganization
        // Update other properties as needed
        );

    bussinessDataProvider.updateCard(updatedCard);

    // Provide feedback to the user (e.g., show a snackbar or navigate back)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bussiness updated successfully!'),
      ),
    );

    // You can also navigate back to the previous page if needed
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    final bussDataProvider = Provider.of<BusinessDataProvider>(context);

    void handleClick(bussCard) {
      bussDataProvider.removeCard(bussCard);
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
                      'Update Bussiness',
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
                      hintText: widget.oldBusCard.name),
                ),
                SizedBox(height: size * 0.05),
                //--------------------------
                // Select orgainization
                // -------------------------
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(5.0),
                //   child: Container(
                //     padding: const EdgeInsets.only(left: 7.2),
                //     decoration: BoxDecoration(
                //       border: Border.all(
                //         color: Colors.grey,
                //         width: 2.0,
                //       ),
                //     ),
                //     child: DropdownButtonFormField<String>(
                //       decoration: const InputDecoration(
                //         border: InputBorder.none,
                //         hintText: 'Select orgainization',
                //         contentPadding: EdgeInsets.zero,
                //       ),
                //       items: selectedOrg
                //           .map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //       onChanged: (String? newValue) {
                //         // Handle dropdown value changes here

                //         OrganSelected = newValue;
                //       },
                //       // Set an initial value if needed
                //     ),
                //   ),
                // ),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: widget.oldBusCard.selectedOrganization,
                  ),
                  items:
                      selectedOrg.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      OrganSelected = newValue;
                    });
                  },
                ),

                SizedBox(height: size * 0.05),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: widget.oldBusCard.location,
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
                    hintText: widget.oldBusCard.description,
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
