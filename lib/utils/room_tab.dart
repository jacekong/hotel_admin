import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hotel_admin/pages/assign.dart';
import 'package:hotel_admin/pages/home_page.dart';
import 'package:hotel_admin/pages/sales_report.dart';
import 'package:hotel_admin/pages/top10.dart';
import 'package:hotel_admin/utils/text_style.dart';

class RoomAssign extends StatefulWidget {
  const RoomAssign({super.key});

  @override
  State<RoomAssign> createState() => _TabPageState();
}

class _TabPageState extends State<RoomAssign> with TickerProviderStateMixin {
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
        title: Text(
          "XinDu Admin",
          style: TextStyleF.bold,
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
                  Tab(text: "Reservation"),
                  Tab(text: "Assigned Room"),
                ]),
          ),
          // tab bar view
          // SizedBox(height: 7,),
          Expanded(
            child: Container(
              color: Colors.white,
              child: TabBarView(
                controller: _tabController,
                children: [
                  HomePage(),
                  Assign(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // send data to db

  
}
