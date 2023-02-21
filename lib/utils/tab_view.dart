import 'package:flutter/material.dart';
import 'package:hotel_admin/pages/sales_report.dart';
import 'package:hotel_admin/pages/top10.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin{

  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Management Report",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // tab bar 
          Align(
            alignment: Alignment.center,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.green,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black, 
              indicatorColor: Colors.transparent,
              isScrollable: true,         
              tabs: const [
                Tab(text: "Sales Report"),
                Tab(text: "Top 10 Guest In Month"),
              ]
            ),
          ),
          // tab bar view
          // SizedBox(height: 7,),
          Expanded(
            child: Container(
              color: Colors.white,
              child: TabBarView(  
                controller: _tabController,
                children: [
                  SaleReport(),
                  TopGuest(),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
