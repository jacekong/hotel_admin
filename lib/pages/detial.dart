import 'dart:convert';

import 'package:hotel_admin/model/room_model.dart';
import 'package:hotel_admin/pages/assign.dart';
import 'package:hotel_admin/utils/central.dart';
import 'package:hotel_admin/utils/dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hotel_admin/model/reservation_model.dart';
import 'package:hotel_admin/utils/text_style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  ReservationModel reservation;

  late Store agent;

  DetailScreen({required this.reservation, super.key});

  @override
  Widget build(BuildContext context) {
    agent = Provider.of<Store>(context);

    void _showDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return Dialogbox(
              onPost: () {
                //move to new creen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Assign(),
                  ),
                );
              },
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Assigning Room"),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("ID: ", style: TextStyleF.bold),
                          Text(
                            reservation.ReservationID.toString(),
                            style: TextStyleF.bold,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Arrival date: ", style: TextStyleF.bold),
                          Text(reservation.ArrivalDate, style: TextStyleF.bold),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Departure date: ", style: TextStyleF.bold),
                          Text(reservation.DepartureDate.substring(0, 10),
                              style: TextStyleF.bold),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Arrival time: ", style: TextStyleF.bold),
                          Text(reservation.ArrivalTime, style: TextStyleF.bold),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Departure time: ", style: TextStyleF.bold),
                          Text(reservation.DepartureTime,
                              style: TextStyleF.bold),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Room type: ", style: TextStyleF.bold),
                          Text(reservation.RoomType, style: TextStyleF.bold),
                        ],
                      ),
                    ],
                  ),
                  const VerticalDivider(),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: FutureBuilder<List<RoomModel>>(
                            future: agent.getRoomNo(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                //return progress
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                //return widget
                                return ListView.builder(
                                  itemCount: agent.roomno.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: Container(
                                        height: 37,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(agent.roomno[index].RoomNo
                                                .toString()),
                                            Text(agent.roomno[index].RoomType),
                                            Text(
                                                agent.roomno[index].RoomStatus),
                                            MaterialButton(
                                              onPressed: () {
                                                sendData(
                                                    reservation.guest_id,
                                                    agent.roomno[index].RoomNo,
                                                    reservation.ReservationID,
                                                    reservation.DepartureDate,
                                                    reservation.room_assigned);
                                                _showDialog();
                                              },
                                              child: Text("Confirm",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// send room type to db
Future<void> sendData(guestid, roomno, resid, departure, status) async {
  //1. define url
  var url = "http://192.168.80.168:1880/assignroom";

  //2. convert list of objects to list of dictionary
  var data1 = {
    "guestid": guestid,
    "roomno": roomno,
    "resid": resid,
    "departure": departure,
    "status": status
  };

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
