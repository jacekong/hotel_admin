import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotel_admin/model/reservation_model.dart';
import 'package:hotel_admin/pages/detial.dart';
import 'package:hotel_admin/utils/central.dart';
import 'package:hotel_admin/utils/text_style.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  late Store agent;

  @override
  Widget build(BuildContext context) {
    //store reference

    agent = Provider.of<Store>(context);

    return Scaffold(
      //body
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "#",
                    style: TextStyleF.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Arrival Date", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Departure Date", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Arrival Time", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Departure Time", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Special Request", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Room Type", style: TextStyleF.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Assigned?", style: TextStyleF.bold),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Divider(
              thickness: 2,
            ),
          ),
          Expanded(
            flex: 1,
            child: FutureBuilder<List<ReservationModel>>(
              future: agent.fetchData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  //return progress
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  //return widget
                  return agent.reservation.isEmpty
                      ? const Center(
                          child: Text("There is no reservation yet..."),
                        )
                      : ListView.builder(
                          itemCount: agent.reservation.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: GestureDetector(
                                onTap: () {
                                  //move to new creen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          reservation:
                                              agent.reservation[index]),
                                    ),
                                  );
                                  sendData(agent.reservation[index].RoomType,
                                      agent.reservation[index].guest_id);
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            agent.reservation[index]
                                                .ReservationID
                                                .toString(),
                                            style: TextStyleF.id,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(agent
                                              .reservation[index].ArrivalDate
                                              .substring(0, 10)),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(agent
                                              .reservation[index].DepartureDate
                                              .substring(0, 10)),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(agent
                                              .reservation[index].ArrivalTime),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(agent.reservation[index]
                                              .DepartureTime),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(agent.reservation[index]
                                              .SpecialRequest),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              agent.reservation[index].RoomType,
                                              style: TextStyleF.id),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(agent.reservation[index]
                                              .room_assigned),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//ec
// send room type to db
Future<void> sendData(roomType, gid) async {
  //1. define url
  var url = "http://192.168.80.168:1880/sendroomtype";

  //2. convert list of objects to list of dictionary
  var data1 = {"roomType": roomType, "gid": gid};

  //3. send request along with the data
  //headers is required
  //data need to be encoded to json text
  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-type': 'application/json'},
    body: json.encode(data1),
  );
  print(response.body);
} //ef