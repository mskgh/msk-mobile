import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../../../../widgets/model/CardModels.dart';
import '../../../../../../../widgets/model/OrganizationDataProvider.dart';
import '../update_organization.dart';

class OrganizationPhoneListView extends StatefulWidget {
  const OrganizationPhoneListView({
    super.key,
  });

  @override
  State<OrganizationPhoneListView> createState() => _OrganizationState();
}

class _OrganizationState extends State<OrganizationPhoneListView> {
  String? selectedValue; // Define the selectedValue variable

  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String searchText = ''; // Add searchText variable

  @override
  void initState() {
    super.initState();
    // Initialize selectedValue with a default value if needed
    selectedValue = 'Option 1';
  }

  @override
  Widget build(BuildContext context) {
    //double size = MediaQuery.of(context).size.width;
    final organizationDataProvider =
        Provider.of<OrganizationDataProvider>(context);

    void handleClick(int item, OrganizationCard organizationCard) {
      switch (item) {
        case 0:
          organizationDataProvider.removeCard(organizationCard);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Your deleted organization has been moved to pending deletion'),
            ),
          );
          break;
        case 1:
          break;
      }
    }

    //  // Call the callback function whenever search text changes
    // void onSearchTextChanged(String value) {
    //   setState(() {
    //     searchText = value;
    //   });
    //   widget.onValueChanged(value); // Call the callback function
    // }

    return Scaffold(
      body: Consumer<OrganizationDataProvider>(
        builder: (context, dataProvider, _) {
          final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
          final cards = dataProvider.cards.where((card) {
            final nameMatches =
                card.name.toLowerCase().contains(searchText.toLowerCase());
            final locationMatches =
                card.location.toLowerCase().contains(searchText.toLowerCase());
            return nameMatches || locationMatches;
          }).toList();

          if (cards.isEmpty) {
            return const Center(
              child: Text(
                'No OrganizationPhoneListView Created',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return SizedBox(
                height: 170,
                child: Card(
                  elevation: 5,
                  surfaceTintColor: isDarkTheme
                      ? const Color(0xFF3B3A38)
                      : const Color(0XFFFFFFFF),
                  color: isDarkTheme
                      ? const Color(0xFF3B3A38)
                      : const Color(0XFFFFFFFF),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: isDarkTheme
                              ? const Color(0xFF3B3A38)
                              : Colors.grey,
                          width: 0.7),
                      borderRadius: BorderRadius.circular(10.0)),
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppians',
                                      fontSize: 16,
                                      color: isDarkTheme
                                          ? const Color(0xFFFFFFFF)
                                          : const Color(0xFF000000),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    card.location,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppians',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            PopupMenuButton<int>(
                              onSelected: (item) => handleClick(item, card),
                              itemBuilder: (context) => const [
                                PopupMenuItem<int>(
                                    value: 0, child: Text('Delete')),
                                PopupMenuItem<int>(
                                    value: 1, child: Text('View Info')),
                              ],
                            ),
                          ],
                        ),
                        //Expanded(child: Container()),
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: isDarkTheme
                                      ? const Color(0xFF3B3A38)
                                      : const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: isDarkTheme
                                        ? Colors.white
                                        : Colors.grey,
                                    width: isDarkTheme ? 1.5 : 0.5,
                                  ),
                                ),
                                child: Text(
                                  cdate,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Poppians',
                                    color: isDarkTheme
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF3B3A38),
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15.0)),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return UpdateOrganization(
                                        oldCard: card,
                                      );
                                    },
                                  );
                                },
                                child: const ImageIcon(
                                  AssetImage("assets/images/edit.png"),
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
