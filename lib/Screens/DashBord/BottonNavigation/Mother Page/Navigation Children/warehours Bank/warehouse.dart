import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../widgets/model/CardModels.dart';
import '../../../../../../widgets/model/OrganizationDataProvider.dart';

class Warehouse extends StatefulWidget {
  const Warehouse({super.key});

  @override
  State<Warehouse> createState() => _Warehouse();
}

class _Warehouse extends State<Warehouse> {
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
    final warehouseDataProvider = Provider.of<WarehouseDataProvider>(context);

    void handleClick(int item, WarehouseCard warehouseCard) {
      switch (item) {
        case 0:
          warehouseDataProvider.removeWareHouse(warehouseCard);
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

    return Scaffold(
      body: Consumer<WarehouseDataProvider>(
        builder: (context, dataProvider, _) {
          final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
          final cards = dataProvider.wCards;
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return SizedBox(
                height: 160,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  card.name,
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
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppians',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
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
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isDarkTheme
                                    ? const Color(0xFF3B3A38)
                                    : const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color:
                                      isDarkTheme ? Colors.white : Colors.grey,
                                  width: isDarkTheme ? 1.5 : 0.5,
                                ),
                              ),
                              child: Text(
                                cdate,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppians',
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
                                // showModalBottomSheet<void>(
                                //   isScrollControlled: true,
                                //   shape: const RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.vertical(
                                //         top: Radius.circular(15.0)),
                                //   ),
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return const UpdateOrganization();
                                //   },
                                // );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Wait a minute'),
                                  ),
                                );
                              },
                              child: const ImageIcon(
                                AssetImage("assets/images/edit.png"),
                                size: 35,
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
          );
        },
      ),
    );
  }
}
