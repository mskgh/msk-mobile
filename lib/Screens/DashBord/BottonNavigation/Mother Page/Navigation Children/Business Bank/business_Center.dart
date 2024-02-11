import 'package:flutter/material.dart';
import '../../../../../../widgets/DashBordAppBar/appBar.dart';
import 'business.dart';
import 'business_pending_deletion.dart';
import 'deletedBusiness.dart';
// Import the DeletedOrganizationsPage widget

class BusinessHome extends StatefulWidget {
  const BusinessHome({super.key});

  @override
  _BusinessHomeState createState() => _BusinessHomeState();
}

class _BusinessHomeState extends State<BusinessHome>
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
    return Scaffold(
      body: Column(
        children: [
          // const MyCustomAppBar(
          //     myWidget: SearchBars(
          //   searchTitle: 'search Business',
          // )),
          const MyCustomAppBar(
              myWidget: SearchBars(searchTitle: "Search Busness")),
          SizedBox(height: size * 0.05),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: isDarkTheme ? const Color(0xFF201f1d) : Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
              
                labelStyle: const TextStyle(
                  fontFamily: 'Poppians',
                ),
                // indicatorWeight: 20,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isDarkTheme
                      ? const Color(0xFF583935)
                      : const Color(0xFFFFE1DF),
                ),
                labelColor: isDarkTheme
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF000000),
                unselectedLabelColor: isDarkTheme
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF000000),
                tabs: const [
                  Tab(text: 'Business'),
                  Tab(text: 'Pending Deletion'),
                  Tab(text: 'Deleted Business'),
                  //Tab(text: 'Organization Settings'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Business(),
                BusPendingOrganization(),
                DeletedBusiness(),
                //OrganizationSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
