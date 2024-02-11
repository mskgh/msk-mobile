import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/model/CardModels.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';

class PendingOrganization extends StatefulWidget {
  const PendingOrganization({super.key});

  @override
  State<PendingOrganization> createState() => _PendingOrganizationState();
}

class _PendingOrganizationState extends State<PendingOrganization> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final organizationDataProvider =
        Provider.of<OrganizationDataProvider>(context);

    final deletedCards = organizationDataProvider.deletedCards;

    String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

    void handleClick(int item, OrganizationCard organizationCard) {
      switch (item) {
        case 0:
          // Permanently delete the card
          organizationDataProvider.penddingDeletion(organizationCard);

          break;
        case 1:
          // Restore the card
          organizationDataProvider.restoreCard(organizationCard);
          break;
      }
    }

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: deletedCards.length,
        itemBuilder: (context, index) {
          final card = deletedCards[index];
          return SizedBox(
            height: 160,
            child: Card(
              elevation: 5,
              surfaceTintColor: isDarkTheme
                      ? const Color(0xFF3B3A38)
                      : const Color(0XFFFFFFFF),
              color: isDarkTheme ? const Color(0xFF3B3A38) : Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: isDarkTheme ? const Color(0xFF3B3A38) : Colors.grey,
                    width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 33, bottom: 15, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: isDarkTheme
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF000000),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              card.location,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        PopupMenuButton<int>(
                          onSelected: (item) => handleClick(item, card),
                          itemBuilder: (context) => const [
                            PopupMenuItem<int>(value: 0, child: Text('Delete')),
                            PopupMenuItem<int>(
                                value: 1, child: Text('Restore')),
                          ],
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDarkTheme
                                ? const Color(0xFF3B3A38)
                                : const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isDarkTheme ? Colors.white : Colors.grey,
                              width: isDarkTheme ? 1.5 : 0.5,
                            ),
                          ),
                          child: Text(
                            cdate,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: isDarkTheme
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF3B3A38),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Masa! you cant update oranization Here :)'),
                              ),
                            );
                          },
                          child: const ImageIcon(
                            AssetImage("assets/images/edit.png"),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
