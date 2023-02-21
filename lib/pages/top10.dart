import 'package:flutter/material.dart';
import 'package:hotel_admin/model/top.dart';
import 'package:hotel_admin/utils/central.dart';
import 'package:hotel_admin/utils/text_style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TopGuest extends StatefulWidget {
  const TopGuest({super.key});

  @override
  State<TopGuest> createState() => _TopGuestState();
}

class _TopGuestState extends State<TopGuest> {
  late Store agent;

  DateTime _selected = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _selected = value!;
        agent.sendTop10Month(_selected.year, _selected.month);
        agent.getTop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    agent = Provider.of<Store>(context);

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Padding(
                 padding: const EdgeInsets.only(right: 115, bottom: 3),
                 child: MaterialButton(
            color: Colors.blue,
            onPressed: () {
              _showDatePicker();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "pick year/month",
                  style: TextStyle(color: Colors.white),
              ),
            ),
          ),
               ),
            ],
          ),
          Text(
            "XinDu Holiday Hotel",
            style: TextStyleF.bold,
          ),
          Text(
            "Top 10 Guest Report",
            style: TextStyleF.bold,
          ),
          Text("Monthly Ending: ${_selected.toString().substring(0, 10)}",
              style: TextStyleF.bold),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "First Nmae",
                    style: TextStyleF.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Last Name", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Email", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Phone No", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Gender", style: TextStyleF.bold),
                ),
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder<List<TopModel>>(
            future: agent.getTop(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                //return progress
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                //return widget
                return agent.top.isEmpty
                    ? const Center(
                        child: Text("No data for this month",
                            style: TextStyle(fontSize: 20)))
                    : ListView.builder(
                        itemCount:
                            agent.top.length < 10 ? agent.top.length : 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 7, right: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(agent.top[index].FirstName,
                                          style: TextStyleF.id),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(agent.top[index].LastName,
                                          style: TextStyleF.id),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(agent.top[index].Email,
                                          style: TextStyleF.id),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(agent.top[index].PhoneNo,
                                          style: TextStyleF.id),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(agent.top[index].Gender,
                                          style: TextStyleF.id),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              }
            },
          )),
        ],
      ),
    );
  }
}
