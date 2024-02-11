import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobilemsk/widgets/model/OrganizationDataProvider.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/Useable functions/gradient_avator.dart';
import '../../../../../../widgets/model/CardModels.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  String? selectedValue; // Define the selectedValue variable

  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    // Initialize selectedValue with a default value if needed
    selectedValue = 'Option 1';
  }

  @override
  Widget build(BuildContext context) {
    //double size = MediaQuery.of(context).size.width;
    final businessDataProvider =
        Provider.of<BusinessDataProvider>(context);

        

    void handleClick(int item, BusinessCard businessCard) {
      switch (item) {
        case 0:
          businessDataProvider.removeCard(businessCard);
          break;
        case 1:
          break;
      }
    }

    return Scaffold(
      //appBar: const CustomAppBar(child: SearchBar()),
      body: Consumer<BusinessDataProvider>(
        builder: (context, dataProvider, _) {
          double size = MediaQuery.of(context).size.width;
          final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
          final businessCards = dataProvider.bCards;
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: businessCards.length,
            itemBuilder: (context, index) {
              final bCard = businessCards[index];
              return SizedBox(
                height: 105,
                child: Card(
                  elevation: 5,
                  surfaceTintColor: isDarkTheme
                  ? const Color(0xFF3B3A38)
                  : const Color(0XFFFFFFFF),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.all(5),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 7, right: 10, top: 7),
                      child: Row(children: [
                         GradientAvatar(
                            gradientColors: const[
                              Color(0xFF00376D),
                              Color(0xff457BB0)
                            ],
                            radius: 30.0,
                            child: Center(
                                child: Text(
                              bCard.name[0].toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Poppians',
                                color: Color(0xFFFFFFFF),
                                fontSize: 20,
                              ),
                            ))),
                        SizedBox(width: size * 0.05),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            bCard.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppians',
                              color: isDarkTheme
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF000000),
                              fontSize: 16,
                            ),
                          ),
                          Text(bCard.location),
                          Expanded(child: Container()),
                           Text(cdate),
                        ]),
                        Expanded(child: Container()),
                        Column(children: [
                          PopupMenuButton<int>(
                              onSelected: (item)=> handleClick(item, bCard),
                              itemBuilder: (context) => const [
                                PopupMenuItem<int>(
                                    value: 0, child: Text('Delete')),
                                PopupMenuItem<int>(
                                    value: 1, child: Text('View Info')),
                              ],
                            ),
                          Expanded(child: Container()),
                          InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Wait! I will fix you :)'),
                              ),
                            );
                          },
                          child: const ImageIcon(
                            AssetImage("assets/images/edit.png"),
                            size: 24,
                          ),
                        ),
                        ])
                      ])),
                ),
              );
            },
          );
        },
      ),
    );
  }
}








