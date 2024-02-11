import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/Useable functions/gradient_avator.dart';
import '../../../../../../widgets/model/CardModels.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';

class DeletedBusiness extends StatefulWidget {
  const DeletedBusiness({super.key});

  @override
  State<DeletedBusiness> createState() => _DeletedBusinessState();
}

class _DeletedBusinessState extends State<DeletedBusiness> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final businessDataProvider =
        Provider.of<BusinessDataProvider>(context);

    final busDeletedCards = businessDataProvider.pendingBusinessDeletion;

    String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

    void handleClick(int item, BusinessCard businessCard) {
      switch (item) {
        case 0:
          // // Move to pending deletion
          // businessDataProvider.movePendingToDeletion(businessCard);
          break;
        case 1:
          // // Restore the card
          // businessDataProvider.restoreBusinessCard(businessCard);
          // break;
      }
    }

    return Scaffold(
      body: ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: busDeletedCards.length,
      itemBuilder: (context, index) {
        final bCard = busDeletedCards[index];
        return SizedBox(
                height: 105,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.all(5),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 7, right: 10, top: 7),
                      child: Row(children: [
                        const GradientAvatar(
                            gradientColors: [
                              Color(0xFF00376D),
                              Color(0xff457BB0)
                            ],
                            radius: 30.0,
                            child: Center(
                                child: Text(
                              'T',
                              style: TextStyle(
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
                            Text(bCard.location,
                          ),
                          Expanded(child: Container()),
                           Text(cdate),
                        ]),
                        Expanded(child: Container()),
                        Column(children: [
                          PopupMenuButton<int>(
                              onSelected: (item)=> handleClick(item, bCard),
                              itemBuilder: (context) => const [
                                PopupMenuItem<int>(
                                    value: 0, child: Text('Approve')),
                                PopupMenuItem<int>(
                                    value: 1, child: Text('Cancel')),
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
        ),
    );
  }
}


