import 'package:flutter/material.dart';
import 'package:mobilemsk/Screens/DashBord/BottonNavigation/Mother%20Page/Navigation%20Children/organization%20bank/deleted%20organization%20screen%20size/deleted_organization.dart';
import 'package:mobilemsk/Screens/DashBord/BottonNavigation/Mother%20Page/Navigation%20Children/organization%20bank/Organization%20Screen%20Sizes/organizations.dart';
import '../../../../../../widgets/DashBordAppBar/appBar.dart';
import 'pending deletion screen sizes/pendding_deletion.dart';

class OrganizationHome extends StatefulWidget {
  // final Function(String) onValueChanged;
  const OrganizationHome({super.key});

  @override
  _OrganizationHomeState createState() => _OrganizationHomeState();
}

class _OrganizationHomeState extends State<OrganizationHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    //  String searchText = '';
    //   // Call the callback function whenever search text changes
    //   void onSearchTextChanged(String value) {

    //     setState(() {

    //       searchText = value;
    //     });
    //     widget.onValueChanged(value); // Call the callback function
    //   }

    return Scaffold(
      body: Column(
        children: [
          const MyCustomAppBar(
              myWidget: SearchBars(
            searchTitle: "Search Orgainization",
          )),
          SizedBox(height: size * 0.05),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: isDarkTheme ? const Color(0xFF201f1d) : Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              labelStyle: const TextStyle(
                fontFamily: 'Poppians',
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: isDarkTheme
                    ? const Color(0xFF583935)
                    : const Color(0xFFFFE1DF),
              ),
              dividerColor: Colors.transparent,
              labelColor: isDarkTheme
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF000000),
              unselectedLabelColor: isDarkTheme
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF000000),
              tabs: const [
                Tab(text: 'Organization'),
                Tab(text: 'Pending Deletion'),
                Tab(text: 'Deleted Organization'),
                //Tab(text: 'Organization Settings'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Organization(),
                PendingOrganizationCenter(),
                //PendingOrganization(),
                //DeletedOrganizationsPage(),
                DeletedOrganizationsPageCenter()
                //OrganizationSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
